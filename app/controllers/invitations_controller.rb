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
      flash[:error] = "There was a problem.  Please try again."
      redirect_to '/'
    end
  end
end
