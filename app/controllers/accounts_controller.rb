class AccountsController < ApplicationController
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Your account has been updated"
      redirect_to account_path
    else
      flash[:error] = "We could not update account"
      render :action => :edit
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Your account has been created and is ready to use"
      redirect_to login_path
    else
      flash[:error] = "Sorry some information is missing please login to user that has access"
      render :action => :new
    end
  end
  
  def password_reset
    @user = User.new
    store_location
  end
  
  def send_password_reset
    @user = User.find_by_email(params[:user][:email])
    if @user
      ValidateEmails.password_reset(@user).deliver
      flash[:success] = "Your password reset has been sent to #{@user.email}. Please check your account."
    else
      flash[:error] = "Sorry I could not find a email matching '#{params[:user][:email]}'"
    end

    redirect_to back_or_default
  end
  
  def edit_password
    @user = User.find_by_perishable_token(params[:perishable_token])
    if @user
      flash[:success] = "Please enter in your new password you would like to use for account using this email: #{@user.email}"
    else
      flash[:error] = "Sorry could not find your account with that token. Please request another email reset link."
      redirect_to back_or_default
    end
  end
  
  def update_password
    @user = User.find_by_perishable_token(params[:perishable_token])
    if @user
      if @user.update_attributes(params[:user])
        flash[:success] = "You can now login to your account with your new password"
        redirect_to login_path
      else
        flash[:error] = "Sorry could not update account dew to a complicated error"
        render :action => :edit_password, :perishable_token =>  @user.perishable_token
      end
    else
      flash[:error] = "You have passed a bad token. If you have ran into this error then please request a new password reset. Sorry for the inconvenience."
      redirect_to password_reset_account_path
    end

  end
end
