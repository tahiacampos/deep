class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :services]

  def home
    @service = Service.all
    if user_signed_in?
      @usuario = User.find(current_user.id)
    end    
  end

  def services
  end
end
