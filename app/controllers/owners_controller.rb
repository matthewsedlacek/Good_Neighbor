class OwnersController < ApplicationController
    before_action :require_login, only: [:edit, :update, :destroy]

    def show
        @owner = Owner.find(params[:id])
    end

    def new
        @owner = Owner.new
    end

    def create
        @user = Owner.new(owner_params)
        return redirect_to controller: 'owners', action: 'new' unless @user.save
        session[:owner_id] = @user.id
        redirect_to owner_path(@user)
    end

    def edit
        @owner = Owner.find(params[:id])
        return redirect_to root_path unless @owner == @user
    end

    def update
        @owner = Owner.find(params[:id])
        return redirect_to root_path unless @owner == @user
        @owner.update(owner_params)
        redirect_to @owner
    end

    def destroy
        owner = Owner.find(params[:id])
        return redirect_to root_path unless owner == @user
        owner.destroy
        redirect_to new_owner_path
    end

    private

    def owner_params
        params.require(:owner).permit(:username, :email_address, :city, :address, :password, :password_confirmation)
    end

end
