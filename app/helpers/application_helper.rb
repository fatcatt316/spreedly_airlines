module ApplicationHelper
  def flights_navigation_link
    return 'Flights' if controller_name == 'flights' && action_name == 'index'
    link_to('Flights', flights_path)
  end

  def transactions_navigation_link
    return 'Transactions' if controller_name == 'transactions' && action_name == 'index'
    link_to('Transactions', transactions_path)
  end
end
