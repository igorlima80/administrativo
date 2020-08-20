require 'test_helper'

class BankAccountTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_account_type = bank_account_types(:one)
  end

  test "should get index" do
    get bank_account_types_url
    assert_response :success
  end

  test "should get new" do
    get new_bank_account_type_url
    assert_response :success
  end

  test "should create bank_account_type" do
    assert_difference('BankAccountType.count') do
      post bank_account_types_url, params: { bank_account_type: { code: @bank_account_type.code, name: @bank_account_type.name } }
    end

    assert_redirected_to bank_account_type_url(BankAccountType.last)
  end

  test "should show bank_account_type" do
    get bank_account_type_url(@bank_account_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_bank_account_type_url(@bank_account_type)
    assert_response :success
  end

  test "should update bank_account_type" do
    patch bank_account_type_url(@bank_account_type), params: { bank_account_type: { code: @bank_account_type.code, name: @bank_account_type.name } }
    assert_redirected_to bank_account_type_url(@bank_account_type)
  end

  test "should destroy bank_account_type" do
    assert_difference('BankAccountType.count', -1) do
      delete bank_account_type_url(@bank_account_type)
    end

    assert_redirected_to bank_account_types_url
  end
end
