require "spec_helper"

describe CrewMerchandiseOrderLinesController do
  describe "routing" do

    it "routes to #index" do
      get("/crew_merchandise_order_lines").should route_to("crew_merchandise_order_lines#index")
    end

    it "routes to #new" do
      get("/crew_merchandise_order_lines/new").should route_to("crew_merchandise_order_lines#new")
    end

    it "routes to #show" do
      get("/crew_merchandise_order_lines/1").should route_to("crew_merchandise_order_lines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/crew_merchandise_order_lines/1/edit").should route_to("crew_merchandise_order_lines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/crew_merchandise_order_lines").should route_to("crew_merchandise_order_lines#create")
    end

    it "routes to #update" do
      put("/crew_merchandise_order_lines/1").should route_to("crew_merchandise_order_lines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/crew_merchandise_order_lines/1").should route_to("crew_merchandise_order_lines#destroy", :id => "1")
    end

  end
end
