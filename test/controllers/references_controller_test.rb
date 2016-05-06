require 'test_helper'

class ReferencesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @thinker = Thinker.create( name: "Example Thinker", email: "thinker@example.com")
    @reference = @thinker.references.create( authors: "author1", place_of_publication: "place", publisher: "", publishing_year: "1950", title: "Great text")
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
      post :create, thinker_id: @thinker.id, reference: { authors: "author1", place_of_publication: "place", publisher: "", publishing_year: "1950", title: "Great text" }
  end

    assert_redirected_to thinker_path(@thinker)
  end

  test "render new when validation fails on create" do
    post :create, thinker_id: @thinker.id, reference: { authors: "", place_of_publication: "", publisher: "", publishing_year: "", title: "Great text" }
    assert_template 'new'
  end

  test "should show reference" do
    get :show, id: @reference.id
    assert_response :success
    assert_equal @reference, assigns(:reference)
  end

  test "should get edit" do
    get :edit, id: @reference.id
    assert_response :success
  end

  test "should update reference" do
    patch :update, id: @reference.id, reference: { authors: @reference.authors, place_of_publication: @reference.place_of_publication, publisher: @reference.publisher, publishing_year: @reference.publishing_year, thinker_id: @reference.thinker_id, title: @reference.title }
    assert_equal @reference.title, 'Great text'
    assert_redirected_to reference_path(assigns(:reference))
  end

  test "render edit when validation fails on update" do
    params = {title: ''}

    put :update, id: @reference.id, reference: params

    assert_template 'edit'
  end

  test "should destroy reference" do
    assert_difference('Reference.count', -1) do
      delete :destroy, id: @reference
    end

    assert_redirected_to thinker_references_path(@thinker)
  end

end
