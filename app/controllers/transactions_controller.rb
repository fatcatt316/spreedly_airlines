class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.includes(:flight).all
  end

  def new
    flight = Flight.find(params[:flight_id]) # Let it blow up if no flight found
    @transaction = flight.transactions.new
    @saved_cards = saved_cards
  end

  def create
    @transaction = Transaction.new(transaction_params)

    ##### TODO: Cleanup
    if @transaction.valid?
      transaction = spreedly_env.purchase_on_gateway(
        ENV['gateway_token'],
        @transaction.payment_method_token,
        @transaction.amount * 100,
        retain_on_success: @transaction.save_card
      )

      if transaction.succeeded?
        @transaction.transaction_token = transaction.token
        @transaction.save!
        notice = 'Your card info has been saved for future purchases!' if @transaction.save_card?
        redirect_to transactions_path, notice: 'Enjoy your flight!'
      else
        @saved_cards = saved_cards
        flash.now[:notice] = transaction.message
        render :new
      end
    else
      @saved_cards = saved_cards
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount, :email, :flight_id, :payment_method_token, :save_card,
      :ticket_count
    )
  end

  def spreedly_env
    @_spreedly_env ||= Spreedly::Environment.new(ENV['spreedly_environment_key'], ENV['spreedly_access_secret'])
  end

  # TODO: This is probably not the best way to get all these back
  # TODO: Probably way more efficient to save locally, in a SavedCard model perhaps.
  # Returns an array of hashes with :token, :number, and :card_type keys
  def saved_cards
    @_saved_cards ||= Transaction.where(save_card: true).pluck(:payment_method_token).uniq.map do |token|
      credit_card = spreedly_env.find_payment_method(token)
      next unless credit_card

      {
        token: credit_card.token,
        number: credit_card.number, # e.g., "XXXX-XXXX-XXXX-1111"
        card_type: credit_card.card_type
      }
    end
  end
end
