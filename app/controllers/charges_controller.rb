include ActionView::Helpers::NumberHelper

class ChargesController < ApplicationController

  def new
    @amount = number_to_currency(current_order.calculate_total)
  end

  def create
    # Amount in cents
    @formatted_sum  = current_order.calculate_total.to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @formatted_sum,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
