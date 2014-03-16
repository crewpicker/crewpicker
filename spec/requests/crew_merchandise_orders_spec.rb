require 'spec_helper'

describe "CrewMerchandiseOrders" do
  describe "GET /crew_merchandise_orders" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get crew_merchandise_orders_path
      response.status.should be(200)
    end
  end
end
