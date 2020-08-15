class AddressesController < ApplicationController
  before_action :set_address

  def show
    render json: @address
  end
  
  def set_address
    @address = Address.where(contact_id: params[:contact_id])
  end
end
