require 'spec_helper'

describe "crew_merchandise_orders/show" do
  before(:each) do
    @crew_merchandise_order = assign(:crew_merchandise_order, stub_model(CrewMerchandiseOrder,
      :volunteer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
