class AddressesController < ApplicationController
  before_action :set_address, only: [:show]

  def show
  end

  def search
    parsed_address = Address.geocode_address(params[:address])
    if parsed_address
      @address = Address.find_or_create_by(postal_code: parsed_address.data.dig("address", "postcode"),
                                           country_code: parsed_address.data.dig("address", "country_code"))

      respond_to do |format|
        format.html { redirect_to address_path @address }
      end
    else
      render 'home/index'
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit([:postal_code, :country_code])
  end
end
