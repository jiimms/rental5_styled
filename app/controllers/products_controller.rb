class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
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

  def trans_pay
    
    #@item = Item.find params[:item_id]
    @result = Braintree::Transaction.sale(
    :amount => params[:cart_total],
    :credit_card => {
      :number => params[:credit_card_no],
      :expiration_date => "#{params['date']['exp_date(2i)']}/#{params['date']['exp_date(1i)']}"
    },
    :options=> {
                    store_in_vault: true
                  })
    if @result.success?
      current_user.update_columns(braintree_customer_id: @result.transaction.customer_details.id)
      redirect_to :action=>"order", :controller => "cart"
    else
      redirect_to :action=>"trans", notice: "Transaction fail"
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:category, :image, items_attributes: [:id,:brand, :rental_cost, :item_for_rent, :image, :_destroy])
    end
end
