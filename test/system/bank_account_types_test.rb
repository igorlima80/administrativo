require "application_system_test_case"

class BankAccountTypesTest < ApplicationSystemTestCase
  setup do
    @bank_account_type = bank_account_types(:one)
  end

  test "visiting the index" do
    visit bank_account_types_url
    assert_selector "h1", text: "Bank Account Types"
  end

  test "creating a Bank account type" do
    visit bank_account_types_url
    click_on "New Bank Account Type"

    fill_in "Code", with: @bank_account_type.code
    fill_in "Name", with: @bank_account_type.name
    click_on "Create Bank account type"

    assert_text "Bank account type was successfully created"
    click_on "Back"
  end

  test "updating a Bank account type" do
    visit bank_account_types_url
    click_on "Edit", match: :first

    fill_in "Code", with: @bank_account_type.code
    fill_in "Name", with: @bank_account_type.name
    click_on "Update Bank account type"

    assert_text "Bank account type was successfully updated"
    click_on "Back"
  end

  test "destroying a Bank account type" do
    visit bank_account_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bank account type was successfully destroyed"
  end
end
