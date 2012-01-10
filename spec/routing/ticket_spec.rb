require "spec_helper"

describe TicketController do
  describe "routing" do

    it "routes to #dashboard" do
      get("/ticket/dashboard").should route_to("ticket#dashboard")
    end

    it "routes to #open_ticket" do
      get("/ticket/open_ticket").should route_to("ticket#open_ticket")
    end
  it "routes to #pending_ticket" do
      get("/ticket/pending_ticket").should route_to("ticket#pending_ticket")
    end
         it "routes to #completed_ticket" do
      get("/ticket/completed_ticket").should route_to("ticket#completed_ticket")
    end
         it "routes to #new" do
      get("/ticket/new").should route_to("ticket#new")
    end
      it "routes to #assign" do
      get("/ticket/assign").should route_to("ticket#assign")
    end
    end
    end