require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form = FactoryBot.build(:form)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての入力条件を満たしたら送信できること' do
        expect(@form).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'post_codeがない場合は登録できないこと' do
        @form.post_code = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code can't be blank", "Post code is invalid")
      end

      it 'prefecture_codeの選択がない場合は登録できないこと' do
        @form.prefecture_code_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include('Prefecture code must be greater than 1')
      end

      it 'cityがない場合は登録できないこと' do
        @form.city = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberがない場合は登録できないこと' do
        @form.house_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberがない場合は登録できないこと' do
        @form.phone_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
    end
  end
end