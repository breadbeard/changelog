Feature: Output the changelog
  As a project owner that has a git repo with tagged releases
  I want to output the changelog

Scenario: Output changelog for a release tag
    When I successfully run `changelog CL.0.1.20120120.1 -r ../../spec/dot_git`
    Then the output should contain "* Fixes [ENG-6580](https://windermeresolutions.atlassian.net/browse/ENG-6580). Test JIRA tag [bd13232](https://github.com/dvantuyl/changelog/bd13232) (Dwight van Tuyl)"
    And the output should contain "* Test non-JIRA tag [ece268b](https://github.com/dvantuyl/changelog/ece268b) (Dwight van Tuyl)"
    And the output should contain "* [ENG-4744](https://windermeresolutions.atlassian.net/browse/ENG-4744): Test JIRA Tag [32cc38a](https://github.com/dvantuyl/changelog/32cc38a) (Dwight van Tuyl)"
