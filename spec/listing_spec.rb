require 'spec_helper'

module Changelog
  describe Listing do

    before(:each) do
      repo = Changelog.repo
      @listing = Listing.create(repo, :id => '3209c90c5251f62d85f117210a8b8534e1fe434d')
    end
    describe "#message" do

      it "returns the message of a commit" do
        l.message.should == "ENG-5091: Test JIRA tag"
      end
    end

    describe "#to_s" do

      it "returns a pretty log listing of the commit" do

      end

    end
  end
end
