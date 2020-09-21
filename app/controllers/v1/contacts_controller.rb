module V1
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]

    #before_action :authenticate_user!

    # GET /v1/contacts?page=1
    # GET /v1/contacts params => { "page": 1 }
    def index
      # Lista cinco contatos por pagina
      @contacts = Contact.all.page(params[:page]).per(5) 

      render json: @contacts 
    end

    # GET /v1/contacts/1
    def show
      render json: @contact, include: [:kind, :phones, :address ] 
    end

    # POST /v1/contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/contacts/1
    def destroy
      # To destroy a phone_number phones_attributes: {"id": 0, "_destroy": 1}
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def contact_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end
