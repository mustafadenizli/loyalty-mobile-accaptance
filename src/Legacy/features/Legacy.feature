Feature: Legacy

  Background:
    Given Nisa visit at App Homepage on "Türkiye" with language "TR"
    Given Nisa has tap to my account section on bottom tab bar

  Scenario: Legacy
    Given Nisa login with email: "<email>" and password: "<password>"
    When Nisa taps to my modanisa section


