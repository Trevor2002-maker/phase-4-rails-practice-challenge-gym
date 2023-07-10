# app/controllers/clients_controller.rb
class ClientsController < ApplicationController
    before_action :set_client, only: [:show]
  
    def show
      if @client
        total_membership_charge = @client.memberships.sum(:charge)
        render json: @client, methods: :total_membership_charge
      else
        render json: { error: 'Client not found' }, status: :not_found
      end
    end
  
    private
  
    def set_client
      @client = Client.find_by(id: params[:id])
    end
  end