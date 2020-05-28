class AppliancesController < ApplicationController

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
        renter_id = session[:owner_id]
        @appliance = Appliance.new(appliance_params)
        if @appliance.save
            redirect_to @appliance
        else
            flash[:errors] = @appliance.errors.full_messages
            redirect_to new_appliance_url
        end
    end

    
    def destroy
            Owner.find(params[:id]).destroy
            redirect_to @owners
    end

    private

    def appliance_params
        params.require(:appliance).permit(:owner_id, :appliance_name, :appliance_category, :daily_rate, :availability, :avatar)
    end


   
end
