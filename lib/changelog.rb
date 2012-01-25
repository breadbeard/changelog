require 'rubygems'
require 'grit'
require 'mustache'

require "changelog/version"
require "changelog/release"
require "changelog/listing"

module Changelog

  class << self
    attr_accessor :repo_path

    def repo
      @repo ||= Grit::Repo.new(repo_path, :is_bare => true)
    end

    def remote_url
      @remote_url ||= repo.config["remote.origin.url"]
    end

    def remote_https_owner
      remote_url.match(/github.com\/(\w+)\//)[1]
    end

    def remote_ssh_owner
      remote_url.match(/:(\w+)\//)[1]
    end

    def github?
      remote_url && remote_url.match(/github\.com/)
    end

    def github_owner
      return nil unless github?
      @owner ||= remote_url.match(/https/) ? remote_https_owner : remote_ssh_owner
    end

    def github_project
      return nil unless github?
      @project ||= remote_url.match(/\/(\w+)\.git/)[1]
    end

    def github_base
      return nil unless github?
      @github_base ||= "https://github.com/#{github_owner}/#{github_project}"
    end

    def jira_base
      "https://windermeresolutions.atlassian.net"
    end

  end

end

