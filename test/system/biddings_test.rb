require "application_system_test_case"

class BiddingsTest < ApplicationSystemTestCase
  setup do
    @bidding = biddings(:one)
  end

  test "visiting the index" do
    visit biddings_url
    assert_selector "h1", text: "Biddings"
  end

  test "creating a Bidding" do
    visit biddings_url
    click_on "New Bidding"

    fill_in "Description", with: @bidding.description
    fill_in "Name", with: @bidding.name
    fill_in "User", with: @bidding.user_id
    click_on "Create Bidding"

    assert_text "Bidding was successfully created"
    click_on "Back"
  end

  test "updating a Bidding" do
    visit biddings_url
    click_on "Edit", match: :first

    fill_in "Description", with: @bidding.description
    fill_in "Name", with: @bidding.name
    fill_in "User", with: @bidding.user_id
    click_on "Update Bidding"

    assert_text "Bidding was successfully updated"
    click_on "Back"
  end

  test "destroying a Bidding" do
    visit biddings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bidding was successfully destroyed"
  end
end
