require 'spec_helper'

describe "crew_merchandise_order_lines/show" do
  before(:each) do
    @crew_merchandise_order_line = assign(:crew_merchandise_order_line, stub_model(CrewMerchandiseOrderLine,
      :crew_merchandise_order => nil,
      :quantity => 1,
      :merchandise_article_variant => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
