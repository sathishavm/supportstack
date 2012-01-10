require "spec_helper"

describe DepartmentController do
  describe "routing" do

    it "routes to #dashboard" do
      get("/department/dashboard").should route_to("department#dashboard")
    end

    it "routes to #manage" do
      get("/department/manage").should route_to("department#manage")
    end
         it "routes to #show" do
      get("/department/show").should route_to("department#show")
    end
         it "routes to #new" do
      get("/department/new").should route_to("department#new")
    end
      it "routes to #edit" do
      get("/department/edit").should route_to("department#edit")
    end
    end
    end