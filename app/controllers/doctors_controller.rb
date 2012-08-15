class DoctorsController < ApplicationController
  before_filter :require_user
  def index
    @doctors = current_user.doctors
    store_location
  end
  

  
  def show
    @doctor = current_user.doctors.find(params[:id])
    store_location
  end
  
  def edit
    @doctor = current_user.doctors.find(params[:id])
  end
  
  def update
    @doctor = current_user.doctors.find(params[:id])
    if @doctor.update_attributes(params[:doctor])
      flash[:success] = "Doctor #{@doctor.name} has been updated"
      redirect_to back_or_default
    else
      flash[:error] = "Sorry we could not update doctor"
      render :action => :edit
    end
  end
  
  def new
    @doctor = Doctor.new
  end
  
  def create
    @doctor = Doctor.new(params[:doctor])
    if @doctor.save
      flash[:success] = "Doctor #{@doctor.name} has been created"
      redirect_to doctor_path(@doctor)
    else
      flash[:error] = "Sorry we could not create your doctor dew to a error"
      render :action => :new
    end
  end
end
