class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
   @order = Order.new
   @item = Item.new
   @item = Item.find(params[:item_id])
   if @item.user == current_user || @item.purchase.present?
      redirect_to root_path
    else
      render "index"
   end
  end

  def create
  
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
     else
      render action: :index
    end
  end

  private

  def order_params
   params.require(:order).permit(:postal_code, :prefecture_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end

