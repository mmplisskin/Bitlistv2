class ItemsController < ApplicationController
  before_action :find_item, only:[:show, :edit, :update, :destroy]
  before_action :authorized?, only:[:new, :edit, :destroy, :update]

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

  end

  def update
    if @item.update_attributes(item_params)
      redirect_to category_item_path(@item.category_id, @item.id)
    else
      render :edit
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
  end


  def search
    @items = Item.search(params)
  end


private
  def item_params
    params.require(:item).permit(:name, :city, :state, :zipcode, :price, :description, :category_id, :phone_number, :image, :user_id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
