class PaymentsController < ApplicationController

  def index
    @payments = Payment.all
  end

  def new
    @payment = Payment.new
  end

  def edit
    @payment = Payment.find(params[:id])
    render :new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to :root, notice: 'Payment saved.'
    else
      render :new, alert: 'Error with payment'
    end
  end

  def update
    if @payment.update(payment_params)
      redirect_to :root, notice: 'Payment updated.'
    else
      render :new, alert: 'Error updating payment'
    end
  end

  private
  def payment_params
    params.require(:payment).permit(:project_id, :amount_in_cents)
  end
end
