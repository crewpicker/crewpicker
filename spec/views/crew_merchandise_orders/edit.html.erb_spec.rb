require 'spec_helper'

describe "crew_merchandise_orders/edit" do
  before(:each) do
    @crew_merchandise_order = assign(:crew_merchandise_order, stub_model(CrewMerchandiseOrder,
      :volunteer => nil
    ))
  end

  it "renders the edit crew_merchandise_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crew_merchandise_order_path(@crew_merchandise_order), "post" do
      assert_select "input#crew_merchandise_order_volunteer[name=?]", "crew_merchandise_order[volunteer]"
    end
  end
end
