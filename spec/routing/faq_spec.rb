require "spec_helper"

describe FaqController do
  describe "routing" do

    it "routes to #new" do
      get("/faq/new").should route_to("faq#new")
    end

    it "routes to #comments" do
      get("/faq/comments").should route_to("faq#comments")
    end
       
    end
    end