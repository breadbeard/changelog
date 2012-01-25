Feature: Output the changelog
  As a project owner that has a git repo with tagged releases
  I want to output the changelog

Scenario: Output changelog for a release tag
    When I successfully run `changelog CL.0.1.20120120.1 --repo ../../spec/dot_git`
    Then the output should contain "[CL.0.1.20120120.1](https://github.com/dvantuyl/changelog/tree/CL.0.1.20120120.1)"
    And the output should contain "Fixes [ENG-6580](https://windermeresolutions.atlassian.net/browse/ENG-6580). Test JIRA tag"
    And the output should contain "Test non-JIRA tag"
    And the output should contain "[ENG-4744](https://windermeresolutions.atlassian.net/browse/ENG-4744): Test JIRA Tag"


Scenario: Output changelog for the first release tag
    When I successfully run `changelog CL.0.1.20120120.0 --repo ../../spec/dot_git`
    Then the output should contain "[CL.0.1.20120120.0](https://github.com/dvantuyl/changelog/tree/CL.0.1.20120120.0)"
    And the output should contain "Fixed [ENG-6627](https://windermeresolutions.atlassian.net/browse/ENG-6627)-Initial Commit"
    And the output should contain "[ENG-5091](https://windermeresolutions.atlassian.net/browse/ENG-5091): Test JIRA tag"

Scenario: Output changelog for the HEAD release
    When I run `changelog head --repo ../../spec/dot_git` interactively
    And I type "CL.0.1.20120121.0"
    Then the output should contain "[CL.0.1.20120121.0](https://github.com/dvantuyl/changelog/tree/CL.0.1.20120121.0)"
    And the output should contain "Test last commit"
    And the output should contain "[ENG-5955](https://windermeresolutions.atlassian.net/browse/ENG-5955): Test JIRA Tag"

Scenario: Prepend HEAD release changelog to file
    When I run `changelog head --repo ../../spec/dot_git --file CHANGELOG.markdown` interactively
    And I type "CL.0.1.20120121.0"
    Then a file named "CHANGELOG.markdown" should exist


