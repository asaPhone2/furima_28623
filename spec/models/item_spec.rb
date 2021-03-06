require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
  end

  describe '商品出品機能' do
    context '商品出品ができる時' do
      it '全ての入力条件を満たしたら送信できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it 'nameがない場合は登録できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'introductioがない場合は登録できないこと' do
        @item.introduction = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'categoryがない場合は登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be greater than 1')
      end

      it 'item_conditionの選択がない場合は登録できないこと' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be greater than 1')
      end

      it 'delivery_feeの選択がない場合は登録できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be greater than 1')
      end

      it 'prefecture_codeの選択がない場合は登録できないこと' do
        @item.prefecture_code_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture code must be greater than 1')
      end

      it 'preparation_dayの選択がない場合は登録できないこと' do
        @item.preparation_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day must be greater than 1')
      end

      it 'priceの入力がない場合は登録できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが¥300未満であれば登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが¥10,000,000以上であれば登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが全角文字では登録できない' do
        @item.price = 123
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが英数字混合では登録できない' do
        @item.price = '1a23'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英語だけでは登録できない' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'ユーザーが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it '画像がない場合は登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
