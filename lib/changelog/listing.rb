
module Changelog

  class Listing < Grit::Commit


    def to_s
      "* #{jirafy_message} #{githubify_id} (#{author.name})"
    end

    def jirafy_message
      key_pattern = /([A-Z]+-\d+)/

      message.gsub(key_pattern, '[\1](' + Changelog.jira_base + '/browse/\1)')
    end

    def githubify_id
      if Changelog.github?
        "[#{id_abbrev}](#{Changelog.github_base}/#{id_abbrev})"
      else
        "#{id_abbrev}"
      end
    end
  end
end
