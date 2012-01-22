module Changelog
  class Release

    def initialize(tag)
      @tag = tag
    end

    def previous_tag
      @previous_tag ||= _previous_tag
    end

    def _previous_tag
      tags = Changelog.repo.tags.map {|tag| tag.name}
      tag_index = tags.index(@tag)
      tag_index == 0 ? nil : tags[tag_index -1]
    end

    def listings
      @listings ||= _listings
    end

    def _listings
      ref = (previous_tag ? "#{previous_tag}..#{@tag}" : @tag)

      Changelog.repo.commits(ref).map { |commit|
        Listing.create(Changelog.repo, :id => commit.id)
      }
    end
  end
end
