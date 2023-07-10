# app/controllers/gyms_controller.rb
class GymsController < ApplicationController
    before_action :set_gym, only: [:show, :destroy]
  
    def show
      if @gym
        render json: @gym
      else
        render json: { error: 'Gym not found' }, status: :not_found
      end
    end
  
    def destroy
      if @gym
        @gym.destroy
        render json: {}, status: :no_content
      else
        render json: { error: 'Gym not found' }, status: :not_found
      end
    end
  
    private
  
    def set_gym
      @gym = Gym.find_by(id: params[:id])
    end
  end