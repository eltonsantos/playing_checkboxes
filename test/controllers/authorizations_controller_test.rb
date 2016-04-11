require 'test_helper'

class AuthorizationsControllerTest < ActionController::TestCase
  setup do
    @authorization = authorizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:authorizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create authorization" do
    assert_difference('Authorization.count') do
      post :create, authorization: { contract_number: @authorization.contract_number, employee_id: @authorization.employee_id, parcel_value: @authorization.parcel_value, qtd_parcel: @authorization.qtd_parcel, situation: @authorization.situation, total_value: @authorization.total_value }
    end

    assert_redirected_to authorization_path(assigns(:authorization))
  end

  test "should show authorization" do
    get :show, id: @authorization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @authorization
    assert_response :success
  end

  test "should update authorization" do
    patch :update, id: @authorization, authorization: { contract_number: @authorization.contract_number, employee_id: @authorization.employee_id, parcel_value: @authorization.parcel_value, qtd_parcel: @authorization.qtd_parcel, situation: @authorization.situation, total_value: @authorization.total_value }
    assert_redirected_to authorization_path(assigns(:authorization))
  end

  test "should destroy authorization" do
    assert_difference('Authorization.count', -1) do
      delete :destroy, id: @authorization
    end

    assert_redirected_to authorizations_path
  end
end
