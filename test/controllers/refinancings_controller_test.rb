require 'test_helper'

class RefinancingsControllerTest < ActionController::TestCase
  setup do
    @refinancing = refinancings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refinancings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refinancing" do
    assert_difference('Refinancing.count') do
      post :create, refinancing: { authorization_id: @refinancing.authorization_id, contract_number: @refinancing.contract_number, employee_id: @refinancing.employee_id, parcel_value: @refinancing.parcel_value, qtd_parcel: @refinancing.qtd_parcel, refinancing_date: @refinancing.refinancing_date, situation: @refinancing.situation, total_value: @refinancing.total_value }
    end

    assert_redirected_to refinancing_path(assigns(:refinancing))
  end

  test "should show refinancing" do
    get :show, id: @refinancing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refinancing
    assert_response :success
  end

  test "should update refinancing" do
    patch :update, id: @refinancing, refinancing: { authorization_id: @refinancing.authorization_id, contract_number: @refinancing.contract_number, employee_id: @refinancing.employee_id, parcel_value: @refinancing.parcel_value, qtd_parcel: @refinancing.qtd_parcel, refinancing_date: @refinancing.refinancing_date, situation: @refinancing.situation, total_value: @refinancing.total_value }
    assert_redirected_to refinancing_path(assigns(:refinancing))
  end

  test "should destroy refinancing" do
    assert_difference('Refinancing.count', -1) do
      delete :destroy, id: @refinancing
    end

    assert_redirected_to refinancings_path
  end
end
