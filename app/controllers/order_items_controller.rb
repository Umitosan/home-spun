class OrderItemsController < ApplicationController

  def create
    @account = Account.where(user_id: current_user.id).first
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.account_id = @account.id
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id, :order_id)
  end
end
