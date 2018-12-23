class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    
    customer = current_user.stripe_customer

    #customer = Stripe::Customer.create
    customer.sources.create(source: params[:stripeToken])
    subscription = customer.subscriptions.create(plan: params[:plan])

    current_user.assign_attributes(stripe_subscription_id: subscription.id)
    current_user.save

    flash.notice = "Thanks for subscribing!"
    redirect_to root_path
  end
end
