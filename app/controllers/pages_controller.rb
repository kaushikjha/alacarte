class PagesController < ApplicationController
  def show
    if params[:id] == "home" && signed_in?
      redirect_to menus_path
    else
      if %w(home help).include?(params[:id])
        render "pages/show/#{params[:id]}"
      else
        render :status => 404
      end
    end
  end
end