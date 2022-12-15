module Api
  module V1
      class BookingsController < ApplicationController
        def index
          @bookings = Booking.all
          render json: {status: 'SUCCESS', message: 'Loaded bookings', data:@bookings}, status: :ok
        end

        def create
          @booking = Booking.new(booking_params)
          if @booking.save!
            render json: {status: 'SUCCESS', message: 'booking is saved', data:@bookings}, status: :ok
          else
            render json: {status: 'Error', message: 'booking is not saved', data:@booking.errors}, status: :unprocessable_entity
        end
        end

        def show
          @booking = Booking.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded bookings', data:@bookings}, status: :ok
        end

        def update
          @booking = Booking.find(params[:id])
          if @booking.update(booking_params)
            render json: {status: 'SUCCESS', message: 'booking is updated', data:@bookings}, status: :ok
          else
            render json: {status: 'Error', message: 'booking is not updated', data:@booking.errors}, status: :unprocessable_entity
          end
        end

        def delete
          @booking = Booking.find(params[:id])
          @booking.destroy
          render json: {status: 'SUCCESS', message: 'booking successfully deleted', data:@booking}, status: :ok
        end

        private

        def booking_params
          params.require(:booking).permit(:start_date, :end_date)
        end
      end
  end
end
