class ChargesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @event.price.to_i * 100,
      description: "Rails Stripe customer",
      currency: "usd",
    })

    if charge.created
      redirect_to new_event_charge_attendance_path(:event_id => @event.id, :charge_id => charge.id)
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def edit
  end
end
