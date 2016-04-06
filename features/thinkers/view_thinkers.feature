Feature: view list of thinkers

	As a visitor, I want to be able to browse a list of thinkers

	Scenario: view list of thinkers
		Given a thinker "Example Thinker"
		When I visit the thinkers index page
		Then there should be a thinker "Example Thinker"