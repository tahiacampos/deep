class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
 
  def index
    @usuario = User.find(current_user.id)
    @services = Service.all
    @category = Category.all
  end
 
  def show
    @usuario = User.find(current_user.id)
    # @service = Service.find(params[:id])
  end
 
  def new
    @usuario = User.find(current_user.id)
    if @usuario.user_type == 1
      @service = Service.new
    else
      redirect_to root_path
    end
  end
 
  def create
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    # @usuario = User.find(current_user.id)
    @service = Service.new(service_params)
    @service.user = current_user
    if @service.save
      redirect_to service_path(@service)
    else
      render "new"
    end
  end
 
  def edit
    @service = Service.find(params[:id])
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end
 
  def update
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end
 
  def destroy
  end
 
  private
 
  def service_params
    params.require(:service).permit(:title, :description, :price, :execution_time, :current_user, :category_id, :photo)
  end
end