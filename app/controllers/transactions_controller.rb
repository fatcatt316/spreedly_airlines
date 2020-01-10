class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.includes(:flight).all
  end
end
