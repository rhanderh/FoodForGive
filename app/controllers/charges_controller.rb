class ChargesController < ApplicationController
before_filter :check_for_mobile
respond_to :html,:js, :json

  def new
end

def create
  # Amount in cents



  customer = Stripe::Customer.create(
    :card  => params[:stripeToken]
  )
  

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => params[:amount],
    :description => 'Food for give donation',
    :currency    => 'usd'
  )

 # redirect_to new_confession_path
    
 rescue Stripe::CardError => e
      # The card has been declined or
      # some other error has occured
      flash[:error] = e.message
      render :new
end

  

end
