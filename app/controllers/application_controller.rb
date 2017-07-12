class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_account
  helper_method :current_order_quantity

  def current_order
    if session[:order_id]
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_account
    if current_user
      Account.where(user_id: current_user.id).first
    end
  end

  def current_order_quantity
    quantity = 0
    current_order.order_items.each do |item|
      quantity += item.quantity
    end
    return quantity
  end

end
