class AppliancesController < ApplicationController
    before_action :require_login, only: [:new, :create, :destroy]

    def index
        @appliances = Appliance.where(availability: true)
    end

    def show
        @appliance = Appliance.find(params[:id])
    end

    def new
        @appliance = Appliance.new
    end

    def create
        @appliance = Appliance.new(appliance_params)
        if @appliance.save
            redirect_to @appliance
        else
            flash[:errors] = @appliance.errors.full_messages
            redirect_to new_appliance_url
        end
    end

    def destroy
        appliance = Appliance.find(params[:id])
        return redirect_to root_path unless appliance.owner_id == session[:owner_id]
        appliance.destroy
        redirect_to appliances_path
    end

    private

    def appliance_params
        params.require(:appliance).permit(:owner_id, :appliance_name, :appliance_category, :daily_rate, :availability, :avatar)
    end

end
