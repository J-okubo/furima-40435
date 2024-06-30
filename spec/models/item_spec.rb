require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報入力' do
    context '商品が登録できるとき' do
      it 'image, name, description, genre_id, condition_id, delivery_charge_id, prefecture_id, transit_time_id, priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報入力できないとき' do
      it '画像が空白では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空白では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空白では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'genre_idが空白では登録できない' do
        @item.genre_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre must be other than 1")
      end

      it 'condition_idが空白では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it 'delivery_charge_idが空白では登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it 'prefecture_idが空白では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it 'transit_time_idが空白では登録できない' do
        @item.transit_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Transit time must be other than 1")
      end

      it 'priceが空白では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが半角数値以外では登録できない' do
        @item.price = '金額と１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '価格が300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9_999_999円を超えると出品できない' do
        @item.price =  '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
