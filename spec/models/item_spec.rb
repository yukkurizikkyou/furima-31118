require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: @user.id)
    end


  it "必須項目に全て正しく記述されている時" do
    expect(@item).to be_valid
  end

  it "出品画像が選択されていない時" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it "商品名が未記入の時" do
    @item.name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Name can't be blank")
  end

  

  it "商品の説明が未記入の時" do
    @item.explanation = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Explanation can't be blank")
  end


  it "商品のカテゴリーが未選択の時" do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category Select")
  end

  it "商品カテゴリーが空の場合は出品できない" do
    @item.category_id = ""
    @item.valid?
    
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end

  it "商品の状態が未選択の時" do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition Select")
  end

  it "商品の状態が空の時" do
    @item.condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
  end



  it "配送料の負担が未選択の時" do
    @item.delivery_fee_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery fee Select")
  end

  it "配送料の負担がの空の時" do
    @item.delivery_fee_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
  end

  it "発送元の地域が未選択の時" do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture Select")
  end

  it "発送元の地域が空の時" do
    @item.prefecture_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end

  it "発送までの発送までの日数が未選択の時" do
    @item.day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Day Select")
  end

  it "発送までの発送までの日数が空の時" do
    @item.day_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Day can't be blank")
  end

  it "価格が無いと出品できない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it "価格が299以下の時出品できない" do
    @item.price = 298
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end

  it "価格が10000000以上の時出品できない" do
    @item.price = 10000000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Out of setting range")
  end

  it "価格が全角数字の時出品できない" do
    @item.price = "１２３４"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price Half-width number")
  end
end
end