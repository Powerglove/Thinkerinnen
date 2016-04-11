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

	Scenario: update thinker
		Given a thinker "Example Thinker"
		And I am authenticated
		When I edit the update form and submit the changes
		Then there should be the updated details for the thinker




