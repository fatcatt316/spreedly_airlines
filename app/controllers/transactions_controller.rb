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

    # TODO: Temporary! Calculate this in form with JS on ticket_count field change
    @transaction.set_amount

    if @transaction.save
      redirect_to transactions_path, notice: 'Enjoy your flight!'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:email, :flight_id, :ticket_count)
  end
end
