Given(/^a thinker "([^"]*)"$/) do |name|
	email = "#{name.gsub(' ', '').underscore}@example.com"
  Thinker.create(name: name, email: email)
end

When(/^I visit the thinkers index page$/) do
  visit "/thinkers"
end

Then(/^there should be a thinker "([^"]*)"$/) do |name|
  assert page.has_content?(name), "Expected to find thinker with name '#{name}'"
end