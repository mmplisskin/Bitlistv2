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
    @item=Item.find(params[:id])
    if @item.update_attributes(item_params)
      redirect_to category_item_path(@item.category_id, @item.id)
    else
      render :edit
    end
  end

  def destroy
      @item=Item.find(params[:id])
      @item.destroy
      redirect_to root_path
  end


  def search
    @items = Item.search(params)
  end


private
  def item_params
    params.require(:item).permit(:name, :city, :state, :zipcode, :price, :description, :category_id, :phone_number, :user_id)

  end
end
