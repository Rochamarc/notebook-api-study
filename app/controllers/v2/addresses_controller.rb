module V2
  class AddressesController < ApplicationController
    before_action :set_contact
    
    before_action :authenticate_user!
    def create
      @contact.address = Address.new(address_params)

      if @contact.save
        render json: @contact.address, status: :created, location: contact_address_url(@contact) 
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end 

    # GET /contacts/1/address
    def show
      render json: @contact.address # Extraindo endereço
    end

    def update
      if @contact.address.update(address_params)
        render json: @contact.address
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end
    
    def destroy
      @contact.address.destroy
    end

    private
      def address_params
         ActiveModelSerializers::Deserialization.jsonapi_parse(params) # Deserializar os dados do json enviado
      end

      def set_contact
        @contact = Contact.find(params[:contact_id])
      end
  end
end
