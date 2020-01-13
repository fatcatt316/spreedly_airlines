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

    if @transaction.save
      # TODO: Actually charge the card! All we've done so far is tokenize it in Spreedly's vault
      redirect_to transactions_path, notice: 'Enjoy your flight!'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :email, :flight_id, :payment_method_token, :ticket_count)
  end
end
