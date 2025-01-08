module StudentPaymentsHelper
  def create_stripe_session(payment, success_url, cancel_url)
    Stripe::Checkout::Session.create({
                                                 payment_method_types: [ "card" ],
                                                 line_items: [ {
                                                                price_data: {
                                                                  currency: "usd",
                                                                  product_data: {
                                                                    name: payment.title
                                                                  },
                                                                  unit_amount: (payment.amount * 100).to_i # $50.00
                                                                },
                                                                quantity: 1
                                                              } ],
                                                 mode: "payment",
                                                 success_url: success_url,
                                                 cancel_url: cancel_url
                                               })
  end

  def stripe_webhooks

    # Verify the webhook signature to ensure the event is from Stripe
    begin
      event = Stripe::Webhook.construct_event(request.body.read, request.env["HTTP_STRIPE_SIGNATURE"], ENV["STRIPE_WEBHOOK_SECRET"])
    rescue JSON::ParserError => e
      return nil
    rescue Stripe::SignatureVerificationError => e
      return nil
    end

    # Handle the event
    if event["type"] == "checkout.session.completed"
      session = event["data"]["object"]
      return session.id
    end

    nil
  end

end
