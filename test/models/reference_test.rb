require 'test_helper'

class ReferenceTest < ActiveSupport::TestCase
  def setup
    @thinker = Thinker.create( name: "Example Thinker", email: "thinker@example.com")
    @reference = @thinker.references.create( authors: "author1", place_of_publication: "place", publisher: "", publishing_year: "1950", title: "Great text")
  end

  test "title should be present" do
    @reference.title = ""
    assert_not @reference.valid?
  end

  test "publishing_year should be present" do
  	@reference.publishing_year = ""
  	assert_not @reference.valid?
  end

  test "publishing_year should only be an integer" do
  	@reference.publishing_year = "a"
  	@reference.valid?
  	assert_equal ['is not a number'], @reference.errors.messages[:publishing_year]
	end

  test "place_of_publication should be present" do
  	@reference.place_of_publication = ""
  	assert_not @reference.valid?
  end

end
