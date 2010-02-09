class PagesController < ApplicationController
  def show
    if %w(home).include?(params[:id])
      render "pages/show/#{params[:id]}"
    else
      render :status => 404
    end
  end
end