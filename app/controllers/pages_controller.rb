class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @categoria = Category.all
  end
end
