module Changelog
  class Release < Mustache
    self.template_file = File.join(File.dirname(__FILE__), "../../templates/release.mustache")

    def initialize(tag = nil)
      @tag = tag
    end

    def github_base
      Changelog.github_base
    end

    def last_tag
      @last_tag ||= `git describe --abbrev=0`.strip
    end

    def tag
      @tag ||= _tag
    end

    def _tag
      proj, maj, mnr, yyyy, mm, dd, hf = last_tag.scan(/(\w+)\.(\d+)\.(\d+)\.(\d{4})(\d{2})(\d{2})\.(\d+)/).first

      now = Time.now.to_a
      if now[5] == yyyy.to_i && now[4] == mm.to_i && now[3] == dd.to_i
        hf = hf + 1
      else
        hf = 0
      end

      "#{proj}.#{maj}.#{mnr}.#{now[5]}#{"%02d" % now[4]}#{"%02d" % now[3]}.#{hf}"
    end

    def listings
      @listings ||= _listings
    end

    def _listings

      listings = Changelog.repo.commits_between(last_tag, "HEAD").map { |commit|
        Listing.create(Changelog.repo, :id => commit.id)
      }

      listings.reject {|l| l.message =~ /Merge/ }
              .sort { |x,y| x.author.to_s <=> y.author.to_s }
    end
  end
end
