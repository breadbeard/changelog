require 'rubygems'
require 'grit'

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

    def github?
      remote_url && remote_url.match(/github\.com/)
    end

    def github_owner
      return nil unless github?

      #http or ssh
      @owner ||= remote_url.match(/https/) ? remote_url.match(/github.com\/(\w+)\//)[1] : remote_url.match(/:(\w+)\//)[1]
    end

    def github_project
      return nil unless github?

      @project ||= remote_url.match(/\/(\w+)\.git/)[1]
    end


  end

end

