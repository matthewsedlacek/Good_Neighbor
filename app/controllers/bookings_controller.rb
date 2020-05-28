class BookingsController < ApplicationController
    def new
        @booking = Booking.new
    end

    def create
        renter_id = session[:renter_id]
        appliance_id = params[:booking][:appliance_id].to_i
        @booking = Booking.new(renter_id: renter_id, appliance_id: appliance_id)
        if @booking.save
            redirect_to appliances_path
        else
            flash[:errors] = @booking.errors.full_messages
            redirect_to new_booking_url
        end
    end

    def destroy
        Booking.find(params[:id]).destroy
        redirect_to new_booking
    end

    private

    def booking_params
        params.require(:booking).permit(:appliance_id, :renter_id)
    end
end
