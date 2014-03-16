require "spec_helper"

describe MerchandiseArticleVariantsController do
  describe "routing" do

    it "routes to #index" do
      get("/merchandise_article_variants").should route_to("merchandise_article_variants#index")
    end

    it "routes to #new" do
      get("/merchandise_article_variants/new").should route_to("merchandise_article_variants#new")
    end

    it "routes to #show" do
      get("/merchandise_article_variants/1").should route_to("merchandise_article_variants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/merchandise_article_variants/1/edit").should route_to("merchandise_article_variants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/merchandise_article_variants").should route_to("merchandise_article_variants#create")
    end

    it "routes to #update" do
      put("/merchandise_article_variants/1").should route_to("merchandise_article_variants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/merchandise_article_variants/1").should route_to("merchandise_article_variants#destroy", :id => "1")
    end

  end
end
