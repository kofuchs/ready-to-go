# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include ExceptionNotifiable
  consider_local "0.0.0.0" # "127.0.0.1" is always considered local if want you can do local_addresses.clear and not consider it local
  
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :set_current_user

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  protected
  def set_current_user
    Authorization.current_user = current_user
  end
  def permission_denied
    flash[:error] = "You don't have permission to access this area."
    redirect_to root_url
  end
  
end
