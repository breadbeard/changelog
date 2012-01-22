
module Changelog

  class Listing < Grit::Commit


    def to_s
      "* #{jirafy_message} #{githubify_id} (#{author.name})"
    end

    def jirafy_message
      jira_base = "https://windermeresolutions.atlassian.net"
      key_pattern = /([A-Z]+-\d+)/

      message.gsub(key_pattern, '[\1](' + jira_base + '/browse/\1)')
    end

    def githubify_id

      if Changelog.github?
        owner   = Changelog.github_owner
        project = Changelog.github_project

        "[#{id_abbrev}](https://github.com/#{owner}/#{project}/#{id_abbrev})"
      else
        "#{id_abbrev}"
      end
    end
  end
end
