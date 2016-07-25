class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  
  def index
    @products = Product.all
    if params[:search]
    @products = Product.search(params[:search]).order("category ASC")
  else
    @products = Product.all
  end
  end

  def show
  end

  def new
    @product = Product.new
    @product.items.build
  end

  def edit
    @product.items.build
  end

  def create
    @product = Product.new(product_params)

      if @product.save
        redirect_to @product, notice: 'Product was successfully created.' 
      else
        render :new 
      end
  end
 

  def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.' 
      else
        render :edit 
      end
  end

  def destroy
    @product.destroy
     redirect_to products_url, notice: 'Product was successfully destroyed.' 
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:category, :image, items_attributes: [:id,:brand, :rental_cost, :item_for_rent, :image, :_destroy])
    end
end
