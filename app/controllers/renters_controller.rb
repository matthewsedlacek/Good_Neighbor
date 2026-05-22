class RentersController < ApplicationController
    before_action :require_login, only: [:edit, :update, :destroy]

    def show
       @renter = Renter.find(params[:id])
    end

    def new
       @renter = Renter.new
    end

    def create
        @renter = Renter.new(renter_params)
        return redirect_to controller: 'renters', action: 'new' unless @renter.save
        session[:renter_id] = @renter.id
        redirect_to appliances_path
    end

    def edit
       @renter = Renter.find(params[:id])
       return redirect_to root_path unless @renter == @user
    end

    def update
       @renter = Renter.find(params[:id])
       return redirect_to root_path unless @renter == @user
       @renter.update(renter_params)
       redirect_to @renter
    end

    def destroy
        renter = Renter.find(params[:id])
        return redirect_to root_path unless renter == @user
        renter.destroy
        redirect_to new_renter_path
    end

    private

    def renter_params
        params.require(:renter).permit(:username, :email_address, :city, :address, :password, :password_confirmation)
    end

end
