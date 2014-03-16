require 'spec_helper'

describe "crew_merchandise_order_lines/index" do
  before(:each) do
    assign(:crew_merchandise_order_lines, [
      stub_model(CrewMerchandiseOrderLine,
        :crew_merchandise_order => nil,
        :quantity => 1,
        :merchandise_article_variant => nil
      ),
      stub_model(CrewMerchandiseOrderLine,
        :crew_merchandise_order => nil,
        :quantity => 1,
        :merchandise_article_variant => nil
      )
    ])
  end

  it "renders a list of crew_merchandise_order_lines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
