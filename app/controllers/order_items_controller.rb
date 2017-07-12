class OrderItemsController < ApplicationController

  def create
    @account = current_account
    @order = current_order
    @item = @order.order_items.new(item_params)
    @order.account_id = @account.id
    @order.save
    session[:order_id] = @order.id
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id, :order_id)
  end
end
