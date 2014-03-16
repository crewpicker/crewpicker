require "spec_helper"

describe CrewMerchandiseOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/crew_merchandise_orders").should route_to("crew_merchandise_orders#index")
    end

    it "routes to #new" do
      get("/crew_merchandise_orders/new").should route_to("crew_merchandise_orders#new")
    end

    it "routes to #show" do
      get("/crew_merchandise_orders/1").should route_to("crew_merchandise_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crew_merchandise_orders/1/edit").should route_to("crew_merchandise_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crew_merchandise_orders").should route_to("crew_merchandise_orders#create")
    end

    it "routes to #update" do
      put("/crew_merchandise_orders/1").should route_to("crew_merchandise_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crew_merchandise_orders/1").should route_to("crew_merchandise_orders#destroy", :id => "1")
    end

  end
end
