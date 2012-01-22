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
  end

end

