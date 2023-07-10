class MembershipsController < ApplicationController
    def create
      membership = Membership.new(membership_params)
      if membership.save
        render json: membership, status: :created
      else
        render json: membership.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def membership_params
      params.require(:membership).permit(:gym_id, :client_id, :charge)
    end
  end