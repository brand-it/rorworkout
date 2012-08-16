class PetsController < ApplicationController
  before_filter :collaborator_authorized
  def index
    @customer = current_user.customers.find(params[:customer_id])
    @pets = @customer.pets
  end
  def new
    @customer = current_user.customers.find(params[:customer_id])
    @pet = @customer.pets.build
  end
  
  def create
    @customer = current_user.customers.find(params[:customer_id])
    @pet = @customer.pets.build(params[:pet])
    if @pet.save
      flash[:success] = "Pet #{@pet.name} has been saved"
      redirect_to back_or_default
    else
      flash[:error] = "Pet could not be created"
      render :action => :new
    end
  end
  
  def edit
    @customer = current_user.customers.find(params[:customer_id])
    @pet = @customer.pets.find(params[:id])
  end
  
  def update
    @customer = current_user.customers.find(params[:customer_id])
    @pet = @customer.pets.find(params[:id])
    if @pet.update_attributes(params[:pet])
      flash[:success] = "Pet #{@pet.name} has been updated"
      redirect_to back_or_default
    else
      flash[:error] = "Pet could not be updated"
      render :action => :edit
    end
  end
end
