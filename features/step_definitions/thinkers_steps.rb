

Given(/^a thinker "([^"]*)"$/) do |name|
	email = "#{name.gsub(' ', '').underscore}@example.com"
  @thinker = Thinker.create(name: name, email: email)
  @thinker.topic_list = "math, logic"
  @thinker.save
end

When(/^I visit the thinkers index page$/) do
  visit "/thinkers"
end

Then(/^there should be a thinker "([^"]*)"$/) do |name|
  assert page.has_content?(name), "Expected to find thinker with name '#{name}'"
end


When(/^I visit the thinker's detail page$/) do
  visit thinker_path(@thinker)
end

Then(/^there should be the details for the thinker$/) do 
  assert page.has_content?(@thinker.name), "Expected to find thinker with name '#{@thinker.name}' "
  assert page.has_content?(@thinker.email), "Expected to find detail '#{@thinker.email}' for thinker '#{@thinker.name}'"
  @thinker.topic_list.each do |topic|
  	assert page.has_link?(topic, href: topic_path(topic)), "Expected to find detail '#{topic}' for thinker '#{@thinker.name}'"
	end
end


Given(/^I am authenticated$/) do
  user = User.create(email: "example_user2@example.com", password: "12345678", confirmed_at: 1.day.ago)
  #@request.env["devise.mapping"] = Devise.mappings[:admin]
	login_as(user, :scope => :user)
end

When(/^I edit the update form and submit the changes$/) do
  visit edit_thinker_path(@thinker)
  @new_params = { name: 'Another Thinker' }
  fill_in "Name", with: @new_params[:name] 
  click_button 'Create Thinker'

end

Then(/^there should be the updated details for the thinker$/) do
  assert page.has_content?(@new_params[:name]), "Expected to find thinker with name '#{@new_params[:name]}'"
end


