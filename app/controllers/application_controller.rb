class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    protected
    def after_sign_in_path_for(resource)
        if user_signed_in? && !current_user.subscribed? 
            
            products_path
            
        else
            
            request.env['omniauth.origin'] || stored_location_for(resource) || product_path(2)
            
        end
    end
    
end
