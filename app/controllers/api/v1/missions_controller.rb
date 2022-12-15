module Api
  module V1
      class MissionsController < ApplicationController
        def index
          @missions = Mission.all
          render json: {status: 'SUCCESS', message: 'Loaded missions', data:@missions}, status: :ok
        end

        def create
          @mission = Mission.new(mission_params)
          if @mission.save!
            render json: {status: 'SUCCESS', message: 'mission is saved', data:@missions}, status: :ok
          else
            render json: {status: 'Error', message: 'mission is not saved', data:@mission.errors}, status: :unprocessable_entity
        end
        end

        def show
          @mission = Mission.find(params[:id])
          render json: {status: 'SUCCESS', message: 'Loaded missions', data:@missions}, status: :ok
        end

        def update
          @mission = Mission.find(params[:id])
          if @mission.update(mission_params)
            render json: {status: 'SUCCESS', message: 'mission is updated', data:@missions}, status: :ok
          else
            render json: {status: 'Error', message: 'mission is not updated', data:@mission.errors}, status: :unprocessable_entity
          end
        end

        def delete
          @mission = Mission.find(params[:id])
          @mission.destroy
          render json: {status: 'SUCCESS', message: 'mission successfully deleted', data:@mission}, status: :ok
        end

        private

        def mission_params
          params.require(:mission).permit(:num_rooms)
        end
      end
  end
end
