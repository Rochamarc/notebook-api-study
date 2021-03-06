module V2
  class ContactsController < ApplicationController
    before_action :set_contact, only: [:show, :update, :destroy]

    #before_action :authenticate_user!

    # GET /contacts
    def index
      @contacts = Contact.last(10).reverse

      render json: @contacts #, methods: [:hello, :i18n]
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [:kind, :phones, :address ] # , meta: { author: "Marcos Rocha" }
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1s
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
