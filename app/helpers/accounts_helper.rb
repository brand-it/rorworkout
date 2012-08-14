module AccountsHelper
  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end
end
