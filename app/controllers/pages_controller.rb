class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :services]

  # def index
  #   # @usuario = User.find(current_user.id)
  #   @servicios = Service.all
  # end

  def home
    @services = Service.all
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def services
    if user_signed_in?
      @usuario = User.find(current_user.id)
    end  
  end

  def show
    @service = Service.find(params[:id])
  end
end
