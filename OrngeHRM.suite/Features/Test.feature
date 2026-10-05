Scenario: Add two numbers on the Calculator app
  Given that the Calculator app is running and in focus
  And there is no current value in the calculator
  When you add 3 and 5
  Then the value displayed should be 8