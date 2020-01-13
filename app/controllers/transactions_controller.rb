class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.includes(:flight).all
  end

  def new
    flight = Flight.find(params[:flight_id]) # Let it blow up if no flight found
    @transaction = flight.transactions.new
  end

  def create
    @transaction = Transaction.new(transaction_params)

    ##### TODO: Cleanup
    if @transaction.valid?
      transaction = spreedly_env.purchase_on_gateway(
        ENV['gateway_token'],
        @transaction.payment_method_token,
        @transaction.amount * 100
      )

      if transaction.succeeded?
        @transaction.transaction_token = transaction.token
        @transaction.save!
        redirect_to transactions_path, notice: 'Enjoy your flight!'
      else
        flash.now[:notice] = transaction.message
        render :new
      end
    else
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
end
