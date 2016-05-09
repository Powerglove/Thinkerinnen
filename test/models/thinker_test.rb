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

	test "name should not be too long" do
    @thinker.name = "a" * 51
    assert_not @thinker.valid?
  end

	test "email should not be too long" do
    @thinker.email = "a" * 51 + "@example.com"
    assert_not @thinker.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[thinker@example.com THINKER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @thinker.email = valid_address
      assert @thinker.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[thinker@example,com thinker_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @thinker.email = invalid_address
      assert_not @thinker.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
end
