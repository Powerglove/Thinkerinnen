require 'test_helper'

class ThinkerPolicyTest < ActionController::TestCase
 
 	def setup
    @thinker = Thinker.create( name: "Example Thinker", email: "thinker@example.com")
    @user = users(:example_user)
    @admin = users(:example_user)
		@admin.add_role :admin
  end


  test "admin should be able to delete a thinker" do
    assert_permit @admin, @thinker, :destroy 
  end

  test "non-admin user shouldn't be able to delete a thinker " do
    refute_permit @user, @thinker, :destroy 
  end


end