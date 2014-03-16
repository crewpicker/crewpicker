require 'spec_helper'

describe "merchandise_article_variants/index" do
  before(:each) do
    assign(:merchandise_article_variants, [
      stub_model(MerchandiseArticleVariant,
        :name => "Name",
        :merchandise_article => nil
      ),
      stub_model(MerchandiseArticleVariant,
        :name => "Name",
        :merchandise_article => nil
      )
    ])
  end

  it "renders a list of merchandise_article_variants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
