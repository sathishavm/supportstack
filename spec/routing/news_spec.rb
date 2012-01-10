require "spec_helper"

describe NewsController do
  describe "routing" do

    it "routes to #new" do
      get("/news/new").should route_to("news#new")
    end

    it "routes to #newslist" do
      get("/news/newslist").should route_to("news#newslist")
    end
         it "routes to #edit" do
      get("/news/edit").should route_to("news#edit")
    end
         it "routes to #destroy" do
      get("/news/destroy").should route_to("news#destroy")
    end
    end
    end