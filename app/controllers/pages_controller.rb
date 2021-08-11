class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :services]

  def home
    @service = Service.all
  end

  def services
  end
end
