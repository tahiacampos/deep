class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :services]

  def home
    @categoria = Category.all
  end

  def services
  end
end
