require_dependency "customer/application_controller"

module Customer
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :set_nav
    # GET /properties
    def index
      @properties = current_client.properties
    end

    # GET /properties/1
    def show
    end

    # GET /properties/new
    def new
      @property = current_client.properties.new
    end

    # GET /properties/1/edit
    def edit
    end

    # POST /properties
    def create
      @property = current_client.properties.new(property_params)

      if @property.save
        flash[:success] = t :success
        redirect_to action: "index"
      else
        render :new
      end
    end

    # PATCH/PUT /properties/1
    def update
      if @property.update(property_params)
        flash[:success] = t :success
        redirect_to action: "index"
      else
        render :edit
      end
    end

    # DELETE /properties/1
    def destroy
      if @property.destroy
        flash[:success] = t :success
      else
        flash[:danger]  = t :danger
      end
      
      redirect_to action: "index"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_property
        @property = current_client.properties.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def property_params
        params.require(:property).permit(:situation, :type_property, :status, :iptu,
                                         :project_id, :cep, :region, :district, :group,
                                         :block, :number, :address, :complement, :reference_point, 
                                         :address_link_visible, :rooms, :unit, :value, :value_m2, 
                                         :area, :suit, :parking_spaces, :floor, :sun_position, 
                                         :link_tour, :value_rent,:description, :commercial, :elevator, :coverage, 
                                         :expiration_date, :name, image_path: [], construction_companies_id: [], sellers_id: [], property_attribute_id: [])
      end


      def set_nav
        @nav = "property"
      end
  end
end
