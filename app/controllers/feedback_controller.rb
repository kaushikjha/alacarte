class FeedbackController < ApplicationController
  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.user = current_user
    @feedback.time = Time.now
    if @feedback.save flash[:notice] = 'Your feedback has been recorded.  Thank you.'
    else flash[:error] = 'There was a problem recording your feedback.  Please try again.'
    end
    redirect_to request.referer
  end
end
