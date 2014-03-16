require 'spec_helper'

describe "merchandise_articles/edit" do
  before(:each) do
    @merchandise_article = assign(:merchandise_article, stub_model(MerchandiseArticle,
      :name => "MyString"
    ))
  end

  it "renders the edit merchandise_article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", merchandise_article_path(@merchandise_article), "post" do
      assert_select "input#merchandise_article_name[name=?]", "merchandise_article[name]"
    end
  end
end
