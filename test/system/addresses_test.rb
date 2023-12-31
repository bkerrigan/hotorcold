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
    visit root_path
    assert_selector "h2", text: "Is it hot or cold today?"

    fill_in "address", with: "90210"
    click_on "Search"

    assert_selector "#weather-header", text: "Weather information for Beverly Hills"
  end

  test "Cached search" do
    # When we visit the homepage and do a search for an address
    visit root_path
    assert_selector "h2", text: "Is it hot or cold today?"

    fill_in "address", with: "53711"
    click_on "Search"

    assert_selector "#cache-updated-at"
  end
  #test "caching an address" do
  #  Addresses.all.count
  #end

end
