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

    def log
      ["log", "log", "log"]
    end
  end
end
