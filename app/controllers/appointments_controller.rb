class AppointmentsController < ApplicationController
  before_filter :collaborator_authorized, :only => [:new, :create]
  before_filter :require_user
  def index
    @customes = current_user.customers
  end
  
  def new
    @customer = current_user.my_customers.find(params[:customer_id])
    @appointment = @customer.appointments.build
  end
  
  def create
    @customer = current_user.my_customers.find(params[:customer_id])
    @appointment = @customer.appointments.build(params[:appointment])
    if @appointment.save
      flash[:success] = "Appointment has been created"
      redirect_to back_or_default
    else
      flash[:error] = "Appointment could not be created"
      render :action => :new
    end
  end
  
  def edit
    @customer = current_user.my_customers.find(params[:customer_id])
    @appointment = @customer.appointments.find(params[:id])
  end
  
  def update
    @customer = current_user.my_customers.find(params[:customer_id])
    @appointment = @customer.appointments.find(params[:id])
    
    if @appointment.update_attributes(params[:appointment])
      flash[:success] = "Your appointment has been updated"
      redirect_to customer_path(@customer)
    else
      flash[:error] = "Sorry we could not update your appointment"
      render :action => :edit
    end
  end
end
