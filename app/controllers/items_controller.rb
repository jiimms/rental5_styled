class ItemsController < ApplicationController
	def index
    @items = Item.paginate(page: params[:page], per_page: 20)
    if params[:search]
      @items = Item.search(params[:search]).paginate(page: params[:page])
    else
      @items = Item.paginate(page: params[:page], per_page: 20)
    end
	end
end
