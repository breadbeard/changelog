Feature: Output the changelog
  As a project owner that has a git repo with tagged releases
  I want to output the changelog

Scenario: Output changelog for a release tag
    When I successfully run `changelog CL.0.1.20120120.1 -r ./spec/dot_git`
    Then the stdout should contain "Fixes ENG-6580. Test JIRA tag"
    And the stdout should contain "Test non-JIRA tag"
    And the stdout should contain "ENG-4744: Test JIRA Tag"
