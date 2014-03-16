require 'spec_helper'

describe "merchandise_article_variants/edit" do
  before(:each) do
    @merchandise_article_variant = assign(:merchandise_article_variant, stub_model(MerchandiseArticleVariant,
      :name => "MyString",
      :merchandise_article => nil
    ))
  end

  it "renders the edit merchandise_article_variant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", merchandise_article_variant_path(@merchandise_article_variant), "post" do
      assert_select "input#merchandise_article_variant_name[name=?]", "merchandise_article_variant[name]"
      assert_select "input#merchandise_article_variant_merchandise_article[name=?]", "merchandise_article_variant[merchandise_article]"
    end
  end
end
