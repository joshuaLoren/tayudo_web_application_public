class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    
    if (params[:plan] == "Beta")
      @plan = 2  
    elsif (params[:plan] == "Corporate")
      @plan = 3
    else
      @plan = 4
    end
    
    customer = current_user.stripe_customer

    #customer = Stripe::Customer.create
    customer.sources.create(source: params[:stripeToken])
    subscription = customer.subscriptions.create(plan: params[:plan])

    current_user.assign_attributes(stripe_subscription_id: subscription.id, expires_at: nil)
    
    #receive these via javascript and they are saved to our user
    current_user.assign_attributes(
        card_brand: params[:card_brand],
        card_last4: params[:card_last4],
        card_exp_month: params[:card_exp_month],
        card_exp_year: params[:card_exp_year],
        product_id: @plan
      ) if params[:card_last4]
      
    current_user.save

    flash.notice = "Thanks for subscribing!"
    redirect_to product_path(@plan)
  rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :new  
  end
  
  def show
  end

  def update
    
        
    if (params[:plan] == "Beta")
      @plan = 2  
    elsif (params[:plan] == "Corporate")
      @plan = 3
    else
      @plan = 4
    end
    
    
    customer = current_user.stripe_customer

    #customer = Stripe::Customer.create
    source = customer.sources.create(source: params[:stripeToken])
    customer.default_source = source.id
    customer.save


    current_user.assign_attributes(
        card_brand: params[:card_brand],
        card_last4: params[:card_last4],
        card_exp_month: params[:card_exp_month],
        card_exp_year: params[:card_exp_year],
        product_id: @plan
        
      )
      
     current_user.save
     flash.notice = "Your card was updated successfully"
     redirect_to product_path(@plan)

    rescue Stripe::CardError => e
      flash.alert = e.message
      render action: :show
  end
  
  def destroy
    customer = current_user.stripe_customer
    subscription = customer.subscriptions.retrieve(current_user.stripe_subscription_id).delete

    expires_at = Time.zone.at(subscription.current_period_end)
    current_user.update(expires_at: expires_at, stripe_subscription_id: nil)

    redirect_to root_path, notice: "You have cancelled your subscription. You will have access until #{current_user.expires_at.to_date}."
  end
  
end



