class OrderItemsController < ApplicationController

  def create
    @account = current_account
    @order = current_order

    need_to_create_item = true

    # if you find a duplicate item ... simply update the quantity instead of creating a new one
    @order.order_items.each do |i|
      if (i.product_id == item_params["product_id"].to_i)
        sum = i.quantity + item_params["quantity"].to_i
        i.update(quantity: sum)
        need_to_create_item = false
      end
    end

    # if no items of this type exist, create a new one
    if need_to_create_item
      @order.order_items.new(item_params)
      @order.account_id = @account.id
      @order.save
    end

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
    respond_to do |format|
      format.html { redirect_to products_url }
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id, :order_id)
  end

end
