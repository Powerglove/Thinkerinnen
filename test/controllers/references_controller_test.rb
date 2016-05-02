require 'test_helper'

class ReferencesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @thinker = Thinker.create( name: "Example Thinker", email: "thinker@example.com")
    #@thinker.references = references(:one)
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @user = users(:example_user)
    sign_in @user
  end

  test "should get index" do
    get :index, :thinker_id => 1
    assert_response :success
    assert_not_nil assigns(:references)
  end

  test "should get new" do
    get :new, :thinker_id => 1
    assert_response :success
  end

  test "should create reference" do
    assert_difference('Reference.count') do
      #post :create, reference: { authors: @reference.authors, place_of_publication: @reference.place_of_publication, publisher: @reference.publisher, publishing_year: @reference.publishing_year, thinker_id: @reference.thinker_id, title: @reference.title }
      post :create, thinker_id: @thinker_id, reference: { authors: @reference.authors, place_of_publication: @reference.place_of_publication, publisher: @reference.publisher, publishing_year: @reference.publishing_year, thinker_id: @reference.thinker_id, title: @reference.title }
      #post :create, story: @story.attributes, user_id: @user.id
    end

    assert_redirected_to reference_path(assigns(:reference))
  end

  test "should show reference" do
    get :show, thinker_id: @thinker_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reference
    assert_response :success
  end

  test "should update reference" do
    patch :update, id: @reference, reference: { authors: @reference.authors, place_of_publication: @reference.place_of_publication, publisher: @reference.publisher, publishing_year: @reference.publishing_year, thinker_id: @reference.thinker_id, title: @reference.title }
    assert_redirected_to reference_path(assigns(:reference))
  end

  test "should destroy reference" do
    assert_difference('Reference.count', -1) do
      delete :destroy, id: @reference
    end

    assert_redirected_to references_path
  end
end
