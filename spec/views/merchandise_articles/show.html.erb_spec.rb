require 'spec_helper'

describe "merchandise_articles/show" do
  before(:each) do
    @merchandise_article = assign(:merchandise_article, stub_model(MerchandiseArticle,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
