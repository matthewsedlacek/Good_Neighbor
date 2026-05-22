class BookingsController < ApplicationController
    before_action :require_login

    def new
        @booking = Booking.new
    end

    def create
        appliance_id = params[:booking][:appliance_id].to_i
        @booking = Booking.new(renter_id: session[:renter_id], appliance_id: appliance_id)
        if @booking.save
            redirect_to appliances_path
        else
            flash[:errors] = @booking.errors.full_messages
            redirect_to new_booking_url
        end
    end

    def destroy
        booking = Booking.find(params[:id])
        return redirect_to root_path unless booking.renter_id == session[:renter_id]
        booking.destroy
        redirect_to appliances_path
    end

    private

    def booking_params
        params.require(:booking).permit(:appliance_id, :renter_id)
    end
end
