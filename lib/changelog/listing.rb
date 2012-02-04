
module Changelog

  class Listing < Grit::Commit

    def jirafy_message
      key_pattern = /([A-Z]+-\d+)/

      short_message.gsub(key_pattern, '[\1](' + Changelog.jira_base + '/browse/\1)')
    end

    def github_base
      Changelog.github_base
    end
  end
end
