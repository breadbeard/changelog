module Changelog
  class Header

    def initialize(tag)
      @tag = tag
    end

    def to_s
      if Changelog.github?
        header = "[#{@tag}](#{Changelog.github_base}/tree/#{@tag})"
        "#{header}\n#{'-' * header.length}\n"
      else
        "#{@tag}\n#{'-' * @tag.length}\n"
      end
    end
  end
end
