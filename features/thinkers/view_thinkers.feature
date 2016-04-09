Feature: view list of thinkers

	As a visitor, I want to be able to browse a list of thinkers

	Scenario: view list of thinkers
		Given a thinker "Example Thinker"
		When I visit the thinkers index page
		Then there should be a thinker "Example Thinker"

	Scenario: view individual thinker
		Given a thinker "Example Thinker"
		When I visit the thinker's detail page
		Then there should be the details for the thinker

	Scenario: update individual thinker
		Given a thinker "Example Thinker"
		When I click on the edit-button next to the thinker's name
		Then I should see the edit form
