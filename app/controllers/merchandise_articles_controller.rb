class MerchandiseArticlesController < ApplicationController
  before_action :set_merchandise_article, only: [:show, :edit, :update, :destroy]

  # GET /merchandise_articles
  def index
    @merchandise_articles = MerchandiseArticle.all
  end

  # GET /merchandise_articles/1
  def show
  end

  # GET /merchandise_articles/new
  def new
    @merchandise_article = MerchandiseArticle.new
  end

  # GET /merchandise_articles/1/edit
  def edit
  end

  # POST /merchandise_articles
  def create
    @merchandise_article = MerchandiseArticle.new(merchandise_article_params)

    if @merchandise_article.save
      redirect_to @merchandise_article, notice: 'Merchandise article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /merchandise_articles/1
  def update
    if @merchandise_article.update(merchandise_article_params)
      redirect_to @merchandise_article, notice: 'Merchandise article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /merchandise_articles/1
  def destroy
    @merchandise_article.destroy
    redirect_to merchandise_articles_url, notice: 'Merchandise article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandise_article
      @merchandise_article = MerchandiseArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def merchandise_article_params
      params.require(:merchandise_article).permit(:name)
    end
end
