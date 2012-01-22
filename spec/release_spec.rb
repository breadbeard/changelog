require 'spec_helper'

module Changelog
  describe Release do


    describe "#previous_tag" do

      it "returns the previous tag" do
        rls = Release.new('CL.0.1.20120120.1')
        rls.previous_tag.should == 'CL.0.1.20120120.0'
      end

      it "returns nil if there are not any previous releases" do
        rls = Release.new('CL.0.1.20120120.0')
        rls.previous_tag.should be_nil
      end
    end

    describe "#listings" do
      
      it "returns the release's commit listings" do
        rls = Release.new('CL.0.1.20120120.1')
        rls.listings.size.should == 3
      end
    end

  end

end
