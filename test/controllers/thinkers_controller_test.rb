require 'test_helper'

class ThinkersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @thinker = Thinker.create( name: "Example Thinker", email: "thinker@example.com")
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in users(:example_user)
    @user = users(:example_user)

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
	  params = {name: 'Some name', email: 'email@example.com'}

    assert_difference('Thinker.count') do
	  post :create, thinker: params
	  end
    
    assert_equal params[:name], assigns(:thinker).name
    assert_equal params[:email], assigns(:thinker).email
    assert_redirected_to thinker_path(assigns(:thinker))
	end

  test "render new when validation fails on create" do
    post :create, thinker: {name: 'Some name', email: 'email@example,com'}
    assert_template 'new'
  end

  test "should get show" do
  	get :show, id: @thinker.id
  	assert_response :success
  end

  test "should get edit" do
  	get :edit, id: @thinker.id
  	assert_response :success
  end

  test "should update thinker" do
    params = {name: 'Another Thinker'}

    put :update, id: @thinker.id, thinker: params

    @thinker.reload
    assert_equal @thinker.name, params[:name]
    assert_redirected_to(@thinker)
  end

  test "render edit when validation fails on update" do
    params = {name: ''}

    put :update, id: @thinker.id, thinker: params

    @thinker.reload
    assert_template 'edit'
  end

  test "should delete thinker" do
    @user.add_role :admin
  	assert_difference('Thinker.count', -1) do
    delete :destroy, id: @thinker.id
  	end
    assert_redirected_to thinkers_path
  end

end
