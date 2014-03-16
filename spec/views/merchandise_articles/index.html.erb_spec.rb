require 'spec_helper'

describe "merchandise_articles/index" do
  before(:each) do
    assign(:merchandise_articles, [
      stub_model(MerchandiseArticle,
        :name => "Name"
      ),
      stub_model(MerchandiseArticle,
        :name => "Name"
      )
    ])
  end

  it "renders a list of merchandise_articles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
