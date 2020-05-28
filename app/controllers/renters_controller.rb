class RentersController < ApplicationController

    def show
       @renter = Renter.find(params[:id])
    end

    def new
       @renter = Renter.new
    end

    def create
        @renter = Renter.new(renter_params)
        return redirect_to controller: 'renters', action: 'new' unless @renter.save
        session[:renter_id] = @user.id
        redirect_to appliances_path
    end

    def edit
       @renter = Renter.find(params[:id])
    end

    def update
       @renter = Renter.find(params[:id])
       @renter.update(renter_params)
        redirect_to @renter
    end

    def destroy
        Renter.find(params[:id]).destroy
        redirect_to new_renter
    end

    private

    def renter_params 
        params.require(:renter).permit(:username, :email_address, :city, :address, :password, :password_confirmation)
    end

end



