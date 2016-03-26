require 'test_helper'

class ThinkersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
  def setup
    @thinker = Thinker.create( name: "Example Thinker", email: "thinker@example.com")
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in User.create(email: "thinker@example.com", password: "password", confirmed_at: 1.day.ago)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:thinkers)
  end

  test "should create thinker" do
	  assert_difference('Thinker.count') do
	  post :create, thinker: {name: 'Some name', email: 'email@example.com'}
	  end
 
  	assert_redirected_to thinker_path(assigns(:thinker))
	end

  test "should get show" do
  	get :show, id: @thinker.id
  	assert_response :success
  end

  test "should get edit" do
  	get :edit, id: @thinker.id
  	assert_response :success
  end

  #test "should update thinker" do
  	#put :update, id: @thinker.id
  	#assert_response :success
  #end

  test "should delete thinker" do
  	#assert_difference('Thinker.count') do
    delete :destroy, id: @thinker.id
  	#end
    assert_redirected_to thinkers_path
  end

end
