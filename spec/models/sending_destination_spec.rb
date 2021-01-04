require 'rails_helper'

RSpec.describe SendingDestination, type: :model do
  before do
    @sending_destination = FactoryBot.build(:sending_destination)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての入力条件を満たしたら送信できること' do
        expect(@sending_destination).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'post_codeがない場合は登録できないこと' do
        @sending_destination.post_code = nil
        @sending_destination.valid?
        expect(@sending_destination.errors.full_messages).to include("Order must exist", "Item must exist")
      end

      it 'prefecture_codeの選択がない場合は登録できないこと' do
        @sending_destination.prefecture_code_id = 1
        @sending_destination.valid?
        expect(@sending_destination.errors.full_messages).to include('Prefecture code must be greater than 1')
      end

      it 'cityがない場合は登録できないこと' do
        @sending_destination.city = nil
        @sending_destination.valid?
        expect(@sending_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberがない場合は登録できないこと' do
        @sending_destination.house_number = nil
        @sending_destination.valid?
        expect(@sending_destination.errors.full_messages).to include("House Number can't be blank")
      end

      it 'phone_numberがない場合は登録できないこと' do
        @sending_destination.phone_number = nil
        @sending_destination.valid?
        expect(@sending_destination.errors.full_messages).to include("Phone Number can't be blank")
      end
    end
  end
end
