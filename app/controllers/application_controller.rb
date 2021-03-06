# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user, :signed_in?
  
  around_filter ApiAuthorizedFilter.new
  
  def signed_in?
    ! current_user.nil?
  end
  
  def sign_out!
    @current_user_session.destroy unless !@current_user_session
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    if request.format.html?
      flash[:error] = "Access denied."
      redirect_to '/'
    else
      error = Error["Invalid Token"]
      respond_to do |format|
        format.xml { render :xml => error, :status => 401 }
        format.json { render :json => error, :status => 401 }
      end
    end
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You are already logged in"
      redirect_to account_url
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def require_token
    if !params[:token]
      error = Error["Invalid Token"]
      respond_to do |format|
        format.xml { render :xml => error, :status => 401 }
        format.json { render :json => error, :status => 401 }
      end
    end
  end
end
