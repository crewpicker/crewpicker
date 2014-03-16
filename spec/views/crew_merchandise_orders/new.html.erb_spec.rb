require 'spec_helper'

describe "crew_merchandise_orders/new" do
  before(:each) do
    assign(:crew_merchandise_order, stub_model(CrewMerchandiseOrder,
      :volunteer => nil
    ).as_new_record)
  end

  it "renders new crew_merchandise_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crew_merchandise_orders_path, "post" do
      assert_select "input#crew_merchandise_order_volunteer[name=?]", "crew_merchandise_order[volunteer]"
    end
  end
end
