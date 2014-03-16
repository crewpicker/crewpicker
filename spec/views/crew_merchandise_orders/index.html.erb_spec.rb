require 'spec_helper'

describe "crew_merchandise_orders/index" do
  before(:each) do
    assign(:crew_merchandise_orders, [
      stub_model(CrewMerchandiseOrder,
        :volunteer => nil
      ),
      stub_model(CrewMerchandiseOrder,
        :volunteer => nil
      )
    ])
  end

  it "renders a list of crew_merchandise_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
