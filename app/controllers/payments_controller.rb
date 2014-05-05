class PaymentsController < ApplicationController
  before_filter :check_for_mobile
  before_action :set_confession, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json



  # POST /payments
  # POST /payments.json
  
  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        #Set session value to indicate successful email sharing
        session[:ipayed] = 1
        
        format.js
        #format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
       # format.json { render action: 'show', status: :created, location: @payment }
      else
        format.js
        #format.html { render action: 'new' }
       # format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:email)
    end
end
