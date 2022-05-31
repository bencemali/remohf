# Sample Test Definition Template
# Possible steps:
#		Given
#			a fresh chess clock
#		When / And
#			I press the WHITE button
#			I press the BLACK button
#			I press the START button
#			I press the MOD button
#			I wait for (\d+) ms
#			I wait for (\d+) s
#		Then / And
#			the MAIN display should display the text '(.*)'
#			the WHITE display should display the number (\d+)
#			the BLACK display should display the number (\d+)
#			a BEEP should be made
#			NO BEEP should be made
Feature: Chess clock

  Scenario: Testing settings menu
    Given a fresh chess clock
		When I press the MOD button
		Then a BEEP should be made
		And the MAIN display should display the text 'White initial time'
		When I press the MOD button
		Then a BEEP should be made
		And the MAIN display should display the text 'Black initial time'
		When I press the MOD button
		Then a BEEP should be made
		And the MAIN display should display the text 'Increment time'
		When I press the MOD button
		Then a BEEP should be made
		And the MAIN display should display the text 'Ready to play'

	Scenario: Testing giving up
		Given a fresh chess clock
		When I press the START button
		And I press the MOD button
		Then the MAIN display should display the text 'Game over'
		When I press the START button
		Then the MAIN display should display the text 'Ready to play'
		
	Scenario: Setting times and back to start
		Given a fresh chess clock
		When I press the MOD button
		Then the WHITE display should display the number 60
		When I press the WHITE button
		Then the WHITE display should display the number 65
		When I press the BLACK button
		Then the WHITE display should display the number 60
		When I press the START button
		Then the MAIN display should display the text 'Ready to play'
		When I press the MOD button
		And I press the MOD button
		Then the BLACK display should display the number 60
		When I press the WHITE button
		And I press the BLACK button
		Then the BLACK display should display the number 60
		When I press the START button
		Then the MAIN display should display the text 'Ready to play'
		When I press the MOD button
		And I press the MOD button
		And I press the MOD button
		Then the WHITE display should display the number 0
		When I press the WHITE button
		Then the WHITE display should display the number 1
		When I press the BLACK button
		Then the WHITE display should display the number 0
		When I press the START button
		Then the MAIN display should display the text 'Ready to play'
		
	Scenario: Passing control and time running out
		Given a fresh chess clock
		When I press the START button
		And I press the WHITE button
		And I press the BLACK button
		And I wait for 61 s
		Then the MAIN display should display the text 'White flag fallen'
		When I press the START button
		And I press the START button
		And I press the WHITE button
		And I wait for 61 s
		Then the MAIN display should display the text 'Black flag fallen'
		When I press the START button
		Then the MAIN display should display the text 'Ready to play'
		When I press the START button
		And I press the START button
		Then the MAIN display should display the text 'Ready to play'
		When I press the START button
		And I press the WHITE button
		And I press the START button
		Then the MAIN display should display the text 'Ready to play'