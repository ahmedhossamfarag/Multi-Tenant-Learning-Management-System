json.extract! payment, :id, :user_id, :title, :amount, :stripe_session_id, :completed, :created_at, :updated_at
json.url payment_url(payment, format: :json)
