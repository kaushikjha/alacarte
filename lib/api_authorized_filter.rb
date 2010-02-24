class ApiAuthorizedFilter
  def before(controller)
    if @token = controller.params[:token]
      if @user = User.find_by_single_access_token(@token)
        if @user.hits < @user.rate_limit
          @user.increment!(:hits)
          @user_session = UserSession.new(User.find_by_single_access_token(@token))
          @user_session.save
        else
          error = Error["Rate Limited"]
          respond_to do |format|
            format.xml { render :xml => error, :status => 403 }
            format.json { render :json => error, :status => 403 }
          end
        end
      else
        error = Error["Invalid Token"]
        respond_to do |format|
          format.xml { render :xml => error, :status => 401 }
          format.json { render :json => error, :status => 401 }
        end
      end
    end
  end
  
  def after(controller)
    if @token = controller.params[:token]
      controller.sign_out!
    end
  end
end