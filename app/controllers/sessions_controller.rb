class SessionsController < ApplicationController
  def new
  end


# #old code
#   def create
#     user = Renter.find_by(username: params[:renter][:username]) || Owner.find_by(username: params[:owner][:username])
#     user = user.try(:authenticate, user_params[:password])
#     @user = user
#     return redirect_to(controller: 'sessions', action: 'new') unless @user
#     session[:user_id] = user.id
#     @user = user
#     redirect_to appliances_path
#   end

  # def create
  #   @renter = Renter.find_by(name; params[:username])
  #   if @user && @user.authenticate
  # end

  def create
    if params[:session][:o_r] == 'owner'
      user = Owner.find_by(username: params[:username])
      user.try(:authenticate, params[:password])
    else
      user = Renter.find_by(username: params[:username])
      user.try(:authenticate, params[:password])
    end

    
    # user = (Renter.find_by(username: params[:renter][:username]) || Owner.find_by(username: params[:owner][:username]))
    # user = user.try(:authenticate, params[:renter][:password]) || user.try(:authenticate, params[:owner][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    if params[:username]
      session[:renter_id] = user.id
      redirect_to appliances_path
    else 
      session[:owner_id] = user.id
      redirect_to owner_path      
    end

  end

  def destroy
    session.delete :owner_id || :renter_id
    redirect_to '/'
  end

  private

  def user_params
    params.require(:session).permit(:username, :password)
  end
end