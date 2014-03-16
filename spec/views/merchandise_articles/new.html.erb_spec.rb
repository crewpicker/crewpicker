require 'spec_helper'

describe "merchandise_articles/new" do
  before(:each) do
    assign(:merchandise_article, stub_model(MerchandiseArticle,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new merchandise_article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", merchandise_articles_path, "post" do
      assert_select "input#merchandise_article_name[name=?]", "merchandise_article[name]"
    end
  end
end
