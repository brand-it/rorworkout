class CustomersController < ApplicationController
  def index
    @customers = current_user.customers
  end
  def show
    @customer = current_user.customers.find(params[:id])
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
    @customer = current_user.customer.find(params[:id])
  end
  def edit
  end
end
