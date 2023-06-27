class CategoriesController < ApplicationController

  # GET /categories or /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    category
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_url, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if category.update(category_params)
        format.html { redirect_to categories_url, notice: t('.updated') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: t('.destroyed') }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
