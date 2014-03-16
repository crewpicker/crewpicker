class MerchandiseArticleVariantsController < ApplicationController
  before_action :set_merchandise_article_variant, only: [:show, :edit, :update, :destroy]

  # GET /merchandise_article_variants
  def index
    @merchandise_article_variants = MerchandiseArticleVariant.all
  end

  # GET /merchandise_article_variants/1
  def show
  end

  # GET /merchandise_article_variants/new
  def new
    @merchandise_article_variant = MerchandiseArticleVariant.new
  end

  # GET /merchandise_article_variants/1/edit
  def edit
  end

  # POST /merchandise_article_variants
  def create
    @merchandise_article_variant = MerchandiseArticleVariant.new(merchandise_article_variant_params)

    if @merchandise_article_variant.save
      redirect_to @merchandise_article_variant, notice: 'Merchandise article variant was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /merchandise_article_variants/1
  def update
    if @merchandise_article_variant.update(merchandise_article_variant_params)
      redirect_to @merchandise_article_variant, notice: 'Merchandise article variant was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /merchandise_article_variants/1
  def destroy
    @merchandise_article_variant.destroy
    redirect_to merchandise_article_variants_url, notice: 'Merchandise article variant was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchandise_article_variant
      @merchandise_article_variant = MerchandiseArticleVariant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def merchandise_article_variant_params
      params.require(:merchandise_article_variant).permit(:name, :merchandise_article_id)
    end
end
