class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.new(params[:invitation])
    if @invitation.save
      flash[:notice] = "Thank you.  We'll notify you when we're ready."
      redirect_to '/'
    else
      flash[:error] = @invitation.errors
      redirect_to '/'
    end
  end
end
