module Api
  module V1
      class ListingsController < ApplicationController
        def index
          @listings = Listing.all
          render json: {status: 'SUCCESS', message: 'Loaded listings', data:@listings}, status: :ok
        end

        def create
          @listing = Listing.new(listing_params)
          if @listing.save!
            render json: {status: 'SUCCESS', message: 'Listing is saved', data:@listings}, status: :ok
          else
            render json: {status: 'Error', message: 'Listing is not saved', data:@listing.errors}, status: :unprocessable_entity
        end
        end

        def show
          @listing = Listing.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded listings', data:@listings}, status: :ok
        end

        def update
          @listing = Listing.find(params[:id])
          if @listing.update(listing_params)
            render json: {status: 'SUCCESS', message: 'Listing is updated', data:@listings}, status: :ok
          else
            render json: {status: 'Error', message: 'Listing is not updated', data:@listing.errors}, status: :unprocessable_entity
          end
        end

        def delete
          @listing = Listing.find(params[:id])
          @listing.destroy
          render json: {status: 'SUCCESS', message: 'Listing successfully deleted', data:@listing}, status: :ok
        end

        private

        def listing_params
          params.require(:listing).permit(:num_rooms)
        end
      end
  end
end
