class ItemsController < ApplicationController

  def index
    @items = Item.all
  end


  def new
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      flash[:notice] = "#{@item.name} was successfully listed!."
        redirect_to category_items_path(@item.category_id, @item)
    else
      flash.now[:error] = @item.errors.full_messages
      render :new
    end

  end


  def show
    @item  = Item.find(params[:id])
  end

  def update
  end

private
  def item_params
    params.require(:item).permit(:name, :city, :state, :zipcode, :price, :description, :category_id, :phone_number, :user_id)

  end
end
