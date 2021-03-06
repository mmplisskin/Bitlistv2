class CategoriesController < ApplicationController

  def index
    @categories=Category.all
  end

  def show
    @category = Category.find(params[:id])
    items = Item.where(:category_id => @category.id)
    @items = items.page(params[:page]).per(10)
  end
end
