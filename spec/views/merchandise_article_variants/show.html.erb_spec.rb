require 'spec_helper'

describe "merchandise_article_variants/show" do
  before(:each) do
    @merchandise_article_variant = assign(:merchandise_article_variant, stub_model(MerchandiseArticleVariant,
      :name => "Name",
      :merchandise_article => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
