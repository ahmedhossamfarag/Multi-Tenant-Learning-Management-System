class StudentPaymentsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_student
  before_action :set_payment, only: [ :show, :stripe ]

  def index
    @payments = current_user.payments
  end

  def show
  end

  def stripe
    session = create_stripe_session(@payment, student_payments_success_url, student_payments_cancel_url)
    if @payment.update(stripe_session_id: session.id)
      redirect_to session.url, allow_other_host: true
    else
      status :internal_server_error
    end
  end

  def webhooks
    if (session_id = stripe_webhooks)
      if (payment = Payment.find_by(stripe_session_id: session_id))
        payment.update(completed: true, stripe_session_id: nil)
      end
    end
  end

  def success
  end

  def cancel
  end

  private
  def set_payment
    @payment = Payment.find_by(id: params.expect(:id), user_id: current_user.id)
    unless @payment
      redirect_to action: :index
    end
  end

  include StudentPaymentsHelper
  include Authorization
end
