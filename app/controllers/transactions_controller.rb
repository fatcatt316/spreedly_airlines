class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.includes(:flight).all
  end

  def new
    flight = Flight.find(params[:flight_id]) # Let it blow up if no flight found
    @transaction = flight.transactions.new
    @saved_cards = SavedCard.all
  end

  def create
    @transaction = Transaction.new(transaction_params)

    # TODO: Maybe not this here
    @transaction.payment_method_token = @transaction.saved_card.token if @transaction.saved_card

    ##### TODO: Cleanup
    if @transaction.valid?
      transaction = spreedly_env.purchase_on_gateway(
        ENV['gateway_token'],
        @transaction.payment_method_token,
        @transaction.amount * 100,
        retain_on_success: @transaction.save_card?
      )

      if transaction.succeeded?
        @transaction.transaction_token = transaction.token

        notice_msg = 'Enjoy your flight!'
        if @transaction.saved_card
          notice_msg << ' You used a saved card to pay for this.'
        elsif @transaction.save_card?
          notice_msg << ' Your card has been saved for future purchases!'
          credit_card = spreedly_env.find_payment_method(@transaction.payment_method_token)

          @transaction.build_saved_card(
            last_four_digits: credit_card.last_four_digits,
            card_type: credit_card.card_type,
            token: credit_card.token
          )
        end

        @transaction.save!
        redirect_to transactions_path, notice: notice_msg
      else
        @saved_cards = SavedCard.all
        flash.now[:notice] = transaction.message
        render :new
      end
    else
      @saved_cards = SavedCard.all
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount, :email, :flight_id, :payment_method_token, :save_card,
      :saved_card_id, :ticket_count
    )
  end

  def spreedly_env
    @_spreedly_env ||= Spreedly::Environment.new(ENV['spreedly_environment_key'], ENV['spreedly_access_secret'])
  end
end
