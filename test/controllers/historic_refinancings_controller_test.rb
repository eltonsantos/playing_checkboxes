require 'test_helper'

class HistoricRefinancingsControllerTest < ActionController::TestCase
  setup do
    @historic_refinancing = historic_refinancings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historic_refinancings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historic_refinancing" do
    assert_difference('HistoricRefinancing.count') do
      post :create, historic_refinancing: { authorization_new_id: @historic_refinancing.authorization_new_id, authorization_origin_id: @historic_refinancing.authorization_origin_id, refinancing_id: @historic_refinancing.refinancing_id }
    end

    assert_redirected_to historic_refinancing_path(assigns(:historic_refinancing))
  end

  test "should show historic_refinancing" do
    get :show, id: @historic_refinancing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historic_refinancing
    assert_response :success
  end

  test "should update historic_refinancing" do
    patch :update, id: @historic_refinancing, historic_refinancing: { authorization_new_id: @historic_refinancing.authorization_new_id, authorization_origin_id: @historic_refinancing.authorization_origin_id, refinancing_id: @historic_refinancing.refinancing_id }
    assert_redirected_to historic_refinancing_path(assigns(:historic_refinancing))
  end

  test "should destroy historic_refinancing" do
    assert_difference('HistoricRefinancing.count', -1) do
      delete :destroy, id: @historic_refinancing
    end

    assert_redirected_to historic_refinancings_path
  end
end
