class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @user = (Renter.find_by(id: session[:renter_id]) || Owner.find_by(id: session[:owner_id]))
  end

  def logged_in
    
    current_user.id != nil
  end

  def require_login
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in
  
  end

end
