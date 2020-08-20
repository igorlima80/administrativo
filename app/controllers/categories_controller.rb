class CategoriesController < ApplicationController
  load_and_authorize_resource

  # GET /categories
  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true)
    @categories = @categories.page(params[:page])
  end

  # GET /categories/1
  def show
  end

  # GET /categories/new
  def new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  def products
    res = nil
    res = @category.products.select(:id, :name, :unity)
    render json: res
  end

  private
    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:name)
    end
end
