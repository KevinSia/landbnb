class Public::PaymentsController < ApplicationController

  before_action :authenticate_user
  before_action :made_payment?

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def create
    nonce = params[:payment_method_nonce]
    if nonce && send_braintree_request(nonce)
      payment = @reservation.create_payment(user_id: current_user.id)
      flash[:success] = "Payment success!"
      redirect_to user_reservation_path(current_user, @reservation)
    else
      @errors = @result.errors
      @client_token = Braintree::ClientToken.generate
      render action: :new
    end
  end

  private

  def send_braintree_request(nonce)
    @result = Braintree::Transaction.sale(
      amount: @reservation.price,
      payment_method_nonce: nonce
      )
    @result.success?
  end

  def authenticate_user
    @reservation = Reservation.find(params[:reservation_id])
    unless current_user == @reservation.user
      flash[:warning] = 'Unauthorize user'
      redirect_to '/'
    end
  end

  def made_payment?
    unless @reservation.payment.nil?
      flash[:warning] = "Payment has been made. Please check payment at payments page"
      redirect_to(request.referer || '/')
    end
  end
end