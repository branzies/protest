class LocationsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

def index
  @locations = Location.all #page that shows the map
end

def new
  @location = Location.new
end

def create
  @location = current_user.locations.create(location_params)
  if @location.valid?
    redirect_to locations_path
  else
    render :new, status: :unprocessable_entity
  end
end

def edit
 @location = Location.find(params[:id])

  if @location.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
end

def update
 @location = Location.find(params[:id])
  if @location.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

 @location.update_attributes(location_params)  
  if @location.valid?
    redirect_to locations_path
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @location = Location.find(params[:id])
  if @location.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end
  @location.destroy
  redirect_to locations_path
end


private

def location_params
 params.require(:location).permit(:address, :headline, :description, :danger_level)
end

end
