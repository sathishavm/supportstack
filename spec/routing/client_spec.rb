require "spec_helper"

describe ClientController do
  describe "routing" do

    it "routes to #dashboard" do
      get("/client/dashboard").should route_to("client#dashboard")
    end

    it "routes to #manage" do
      get("/client/manage").should route_to("client#manage")
    end
         it "routes to #show" do
      get("/client/show").should route_to("client#show")
    end
         it "routes to #new" do
      get("/client/new").should route_to("client#new")
    end
      it "routes to #edit" do
      get("/client/edit").should route_to("client#edit")
    end
    end
    end