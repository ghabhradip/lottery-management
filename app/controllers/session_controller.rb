class SessionController < Devise::SessionsController
	def create
	    self.resource = warden.authenticate!(auth_options)
	    set_flash_message(:notice, :signed_in) if is_navigational_format?
	    sign_in(resource_name, resource)
	    if !session[:return_to].blank?
	      redirect_to session[:return_to]
	      session[:return_to] = nil
	    else
	      respond_with resource, :location => "/home/dashboard"
	    end
	  end
end
