require 'spec_helper'

module Changelog
  describe Release do

    describe "#current_tag" do
      it "should return the current tag name" do
        rls = Release.new("CL.0.1.20120120.0")
        puts rls.tag
      end
    end


  end

end
