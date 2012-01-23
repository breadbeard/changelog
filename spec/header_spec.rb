require 'spec_helper'

module Changelog
  describe Header do

    describe "#to_s" do
      it "should output the header linked to the tag tree in github" do
        h = Header.new("Foo")
        h.to_s.should == "[Foo](https://github.com/dvantuyl/changelog/tree/Foo)\n" +
                         "-----------------------------------------------------\n"
      end
    end
  end
end
