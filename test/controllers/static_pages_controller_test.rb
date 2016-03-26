require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  def setup
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in users(:example_user)
  end
  

  test "should get welcome" do
    get :welcome
    assert_response :success
    assert_select "title", "Welcome | Thinkerinnen*"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Thinkerinnen*"
  end

end
