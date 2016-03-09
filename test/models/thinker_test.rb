require 'test_helper'

class ThinkerTest < ActiveSupport::TestCase
 def setup
    @thinker = Thinker.new(name: "Example Thinker", email: "thinker@example.com")
  end

  test "should be valid" do
    assert @thinker.valid?
  end

  test "name should be present" do
    @thinker.name = "     "
    assert_not @thinker.valid?
  end

  test "email should be present" do
  	@thinker.email = "     "
  	assert_not @thinker.valid?
	end

end
