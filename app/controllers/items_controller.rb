class ItemsController < ApplicationController


  def index
  	@items=Item.all
    if params[:search]
    	@items = Item.search(params[:search]).order("rental_cost ASC")
  	else
    	@items = Item.all
  	end
  end

  
end
