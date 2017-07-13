class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  helper_method :current_order
  helper_method :current_account
  helper_method :current_order_quantity
  helper_method :current_order_price

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

  def current_order_price
    price = 0
    current_order.order_items.each do |item|
      price += (item.quantity.to_f * item.product.price.to_f)
    end
    return price
  end

protected

  def authorize
    if !current_user.admin
      flash[:alert] = "you aren't and admin"
      redirect_to '/'
    end
  end

end
