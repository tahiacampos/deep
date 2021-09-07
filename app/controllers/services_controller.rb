class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:autocomplete, :search, :index, :show, :limpieza, :sanitizacion, :mantencion]
 
  def index
    @usuario = User.find(current_user.id)
    @services = Service.all
    @category = Category.all
  end
 
  def show
    #@usuario = User.find(current_user.id)
    @service = Service.find(params[:id])

    if @service.view != nil
      @service.view += 1
      @service.save
    else
      @service.view = 1
      @service.save
    end
    @services = Service.where(id: params[:id]).all
    @markers = @services.geocoded.map do |service|
      {lat: service.latitude, lng: service.longitude}
    end
    # @service = Service.find(params[:id])
    #@id_usuario = current_user.id
    @mas_servicios = Service.where(user_id: @service.user_id)
  end
 
  def new
    @service = Service.new
    @usuario = User.find(current_user.id)
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
    @service = Service.find(params[:id])
    @service.destroy

    # no need for app/views/restaurants/destroy.html.erb

  end

  def compras
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @id_usuario = current_user.id
    @bookings = Booking.where(user_id:@id_usuario)
    @services = Service.all
    
  end

  def servicios
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @id_usuario = current_user.id
    @services = Service.where(user_id:@id_usuario)
  end

  def search
    @services = Service.where("lower(title) LIKE ?", "%#{params[:q].downcase}%")
  end

  def autocomplete
    @services = search.first(5).map{|service|{title:service.title,path:service_path(service)}}
    render json: {date: Time.now, services: @services}
  end

  def limpieza
    @services = Service.where(category_id: 3)
  end

  def sanitizacion
    @services = Service.where(category_id: 1)
  end

  def mantencion
    @services = Service.where(category_id: 2)
  end


  private

 
  def service_params
    params.require(:service).permit(:title, :description, :price, :execution_time, :current_user, :category_id, :photo, :offer, :address)
  end
end
