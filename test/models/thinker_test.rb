require 'test_helper'

class ThinkerTest < ActiveSupport::TestCase
 def setup
    @thinker = Thinker.new(name: "Example Thinker", email: "thinker@example.com")
  end

  test "should be valid" do
    assert @thinker.valid?
  end
end
