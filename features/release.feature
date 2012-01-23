Feature: Output the changelog
  As a project owner that has a git repo with tagged releases
  I want to output the changelog

Scenario: Output changelog for a release tag
    When I successfully run `changelog CL.0.1.20120120.1 --markdown --repo ../../spec/dot_git`
    Then the output should contain "[CL.0.1.20120120.1](https://github.com/dvantuyl/changelog/tree/CL.0.1.20120120.1)"
    And the output should contain "Fixes [ENG-6580](https://windermeresolutions.atlassian.net/browse/ENG-6580). Test JIRA tag [bd13232](https://github.com/dvantuyl/changelog/bd13232)"
    And the output should contain "Test non-JIRA tag [ece268b](https://github.com/dvantuyl/changelog/ece268b)"
    And the output should contain "[ENG-4744](https://windermeresolutions.atlassian.net/browse/ENG-4744): Test JIRA Tag [32cc38a](https://github.com/dvantuyl/changelog/32cc38a)"


Scenario: Output changelog for the first release tag
    When I successfully run `changelog CL.0.1.20120120.0 --markdown --repo ../../spec/dot_git`
    Then the output should contain "[CL.0.1.20120120.0](https://github.com/dvantuyl/changelog/tree/CL.0.1.20120120.0)"
    And the output should contain "Fixed [ENG-6627](https://windermeresolutions.atlassian.net/browse/ENG-6627)-Initial Commit [4f4f0a5](https://github.com/dvantuyl/changelog/4f4f0a5)"
    And the output should contain "[ENG-5091](https://windermeresolutions.atlassian.net/browse/ENG-5091): Test JIRA tag [3209c90](https://github.com/dvantuyl/changelog/3209c90)"

Scenario: Output changelog for the HEAD release
    When I run `changelog head --markdown --repo ../../spec/dot_git` interactively
    And I type "CL.0.1.20120121.0"
    Then the output should contain "[CL.0.1.20120121.0](https://github.com/dvantuyl/changelog/tree/CL.0.1.20120121.0)"
