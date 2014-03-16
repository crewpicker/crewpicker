require 'spec_helper'

describe "crew_merchandise_order_lines/new" do
  before(:each) do
    assign(:crew_merchandise_order_line, stub_model(CrewMerchandiseOrderLine,
      :crew_merchandise_order => nil,
      :quantity => 1,
      :merchandise_article_variant => nil
    ).as_new_record)
  end

  it "renders new crew_merchandise_order_line form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", crew_merchandise_order_lines_path, "post" do
      assert_select "input#crew_merchandise_order_line_crew_merchandise_order[name=?]", "crew_merchandise_order_line[crew_merchandise_order]"
      assert_select "input#crew_merchandise_order_line_quantity[name=?]", "crew_merchandise_order_line[quantity]"
      assert_select "input#crew_merchandise_order_line_merchandise_article_variant[name=?]", "crew_merchandise_order_line[merchandise_article_variant]"
    end
  end
end
