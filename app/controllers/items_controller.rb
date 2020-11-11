class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  def index

  end

  def new
   @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :days_id , :condition_id, :delivery_fee_id, :area_id, :price ).merge(user_id: current_user.id)
  end
end

