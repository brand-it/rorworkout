class CustomersController < ApplicationController
  before_filter :collaborator_authorized
  def index
    @customers = current_user.my_customers
  end
  def show
    @customer = current_user.my_customers.find(params[:id])
    store_location
  end
  def new
    @customer = Customer.new
  end
  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:success] = "Customer #{@customer.full_name}"
      redirect_to customer_path(@customer)
    else
      flash[:error] = "Customer could not be created"
      render :action => :new
    end
  end
  def update
    @customer = current_user.my_customers.find(params[:id])
    if @customer.update_attributes(params[:customer])
      flash[:success] = "Customer #{@customer.full_name} has been updated"
      redirect_to customer_path(@customer)
    else
      flash[:error] = "Could not updated Customer"
    end
  end
  def edit
    @customer = current_user.my_customers.find(params[:id])
  end
end
