require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
    @item.save
    @user = FactoryBot.create(:user)
    sleep 1
    @form = FactoryBot.build(:form, user_id: @user.id,item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての入力条件を満たしたら送信できること' do
        expect(@form).to be_valid
      end

      it 'bilding_numberが抜けていても送信できること' do
        @form.bilding_number = nil
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

      it 'ユーザーが紐付いていないと出品できない' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end

      it 'アイテムが紐付いていないと出品できない' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号はハイフン無しでは登録できないこと" do
        @form.post_code = '1111111'
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code is invalid")
      end

      it "電話番号が12桁以上では登録できないこと" do
        @form.phone_number = '000000000000'
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end

      it "電話番号が英数混合では登録できないこと" do
        @form.phone_number = "0a0000000000"
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number is invalid")
      end
    end

  end
end