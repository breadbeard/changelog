require 'spec_helper'

module Changelog
  describe Listing do

    before(:each) do
      repo = Changelog.repo
      @listing = Listing.create(repo, :id => '3209c90c5251f62d85f117210a8b8534e1fe434d')
    end

    describe "#message" do
      it "returns the message of a commit" do
        @listing.message.should == "ENG-5091: Test JIRA tag"
      end
    end

    describe "#jirafy_message" do
      it "adds jira links to commit message" do
        @listing.jirafy_message.should == "[ENG-5091](https://windermeresolutions.atlassian.net/browse/ENG-5091): Test JIRA tag"
      end
    end
  end
end
