class ChargesController < ApplicationController
  
  def new
end

def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:email],
    :card  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => params[:email],
    :currency    => 'usd'
  )

 rescue Stripe::CardError => e
      # The card has been declined or
      # some other error has occured
      flash[:error] = e.message
      render :new
end

end
