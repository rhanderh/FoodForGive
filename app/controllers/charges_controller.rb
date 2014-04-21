class ChargesController < ApplicationController
#before_filter :check_for_mobile
respond_to :html,:js, :json

def new
end

def create
  # Amount in cents

#Validate the amount to ensure it fits in the safe range.
@donation = params[:amount]
if @donation.to_i < 300 then @donation = 300 
end
if @donation.to_i > 500 then @donation = 500
end

  customer = Stripe::Customer.create(
    :card  => params[:stripeToken]
  )
  

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @donation.to_i,
    :description => 'Food for give donation',
    :currency    => 'usd'
  )

  
respond_to do |format|
  #Set flag to allow view of confessions on successful post
  session[:ipayed] = 1
  puts session[:ipayed]
  #Display the thank you message
  format.js 
end

 rescue Stripe::CardError => e
      # The card has been declined or
      # some other error has occured
      flash[:error] = e.message
      render :new
end

  

end
