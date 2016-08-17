class ApplicationController < ActionController::Base

    before_filter  :authorize

    protect_from_forgery with: :exception

    protected

    def authorize
        unless User.find_by(:id  =>  session[:user_id])
            redirect_to  login_url,  notice:  "Plese  log  in"
        end
    end

    private

    def  current_cart
        Cart.find(session[:cart_id])
    rescue  ActiveRecord::RecordNotFound
        cart  =  Cart.create
        session[:cart_id]  =  cart.id
        cart
    end
end
