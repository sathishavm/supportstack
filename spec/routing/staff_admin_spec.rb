require "spec_helper"

describe StaffAdminController do
  describe "routing" do

    it "routes to #dashboard" do
      get("/staff_admin/dashboard").should route_to("staff_admin#dashboard")
    end

    it "routes to #new" do
      get("/staff_admin/new").should route_to("staff_admin#new")
    end
         it "routes to #edit" do
      get("/staff_admin/edit").should route_to("staff_admin#edit")
    end
         it "routes to #destroy" do
      get("/staff_admin/destroy").should route_to("staff_admin#destroy")
    end
		 it "routes to #manage" do
      get("/staff_admin/manage").should route_to("staff_admin#manage")
    end
		 it "routes to #edit" do
      get("/staff_admin/edit").should route_to("staff_admin#edit")
    end
    end
    end