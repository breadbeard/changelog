module Changelog
  class Release

    def initialize(tag)
      @tag = tag
    end

    def previous_tag
      tags = Changelog.repo.tags.map {|tag| tag.name}
      tag_index = tags.index(@tag)
      tag_index == 0 ? nil : tags[tag_index -1]
    end

    def listings
      release =   Changelog.repo.commits(@tag).map {|c| c.id}
      previous =  Changelog.repo.commits(previous_tag).map {|c| c.id}

      release - previous

      puts release.inspect
      puts previous.inspect
    end
  end
end
