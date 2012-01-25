module Changelog
  class Release < Mustache
    self.template_file = File.join(File.dirname(__FILE__), "../../templates/release.mustache")

    attr_accessor :tag, :display_tag

    def initialize(tag)
      @tag = tag
      @display_tag = tag
      raise "Tag not found" unless tag_index || is_head?
    end

    def github_base
      Changelog.github_base
    end

    def tags
      @tags ||= Changelog.repo.tags.map {|t| t.name}
    end

    def tag_index
      @tag_index ||= tags.index(tag)
    end

    def is_head?
      tag == 'HEAD'
    end

    def previous_tag
      @previous_tag ||= (previous_tag_index >= 0 ? tags[previous_tag_index] : nil)
    end

    def previous_tag_index
      @previous_tag_index ||= (is_head? ? tags.size - 1 : tag_index - 1)
    end

    def listings
      @listings ||= _listings
    end

    def _listings
      ref = (previous_tag ? "#{previous_tag}..#{tag}" : tag)

      Changelog.repo.commits(ref).map { |commit|
        Listing.create(Changelog.repo, :id => commit.id)
      }
    end
  end
end
