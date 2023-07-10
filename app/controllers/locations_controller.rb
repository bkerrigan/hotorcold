class LocationsController < ApplicationController
  require "debug"
  def search
    parsed_address = Address.geocode_address(params[:address])
    if parsed_address
      @address = Address.find_or_create_by(postal_code: parsed_address.data.dig("address", "postcode"),
                                           country_code: parsed_address.data.dig("address", "country_code"))

      respond_to do |format|
        format.html { redirect_to address_path @address }
      end
    else
      #render :new
      # ERROR
    end
  end
end
