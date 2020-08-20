class ProductsController < ApplicationController
  load_and_authorize_resource

  # GET /products
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @products = @products.page(params[:page])
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  def lots
    res = nil
    res = @product
      .components
      .left_joins(:components)
      .select(:id, :unit_value_cents, 'components.quantity - coalesce(sum(components_components.quantity), 0) as available_now')
      .where(kind: 'in')
      .group(:id)
      .having("components.quantity - coalesce(sum(components_components.quantity), 0) > 0")
    render json: res
  end

  private
    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :unity, :category_id)
    end
end
