require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

  #test "should get index" do
   # get :index
    #assert_response :success
  #end

  test "should get index" do
  	thinker = Thinker.create(name: "Test Thinker", email: "test@example.com")
  	thinker.topic_list = "logic, math"
  	thinker.save

  	get :index, topic: 'logic'

  	assert_equal [thinker], assigns(:thinkers)

	end

end
