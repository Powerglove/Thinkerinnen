require 'test_helper'

class ThinkersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thinkers)
  end


  #test "should get destroy" do
   # get :destroy
   # assert_response :success
  #end

end
