require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit addresses_url
  #
  #   assert_selector "h1", text: "Address"
  # end
  setup do
    @address = addresses(:first)
  end

  test "Making a new address search" do
    # When we visit the homepage and do a search for an address
    #
  end

  test "caching an address" do
    Addresses.all.count
  end

end
