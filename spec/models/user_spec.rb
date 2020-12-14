require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規会員登録' do
    context 'ユーザー新規登録ができる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it ' passwordが6文字以上であれば登録できること ' do
        @user.password = '1234a5'
        @user.password_confirmation = '1234a5'
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー新規登録ができない時' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailがない場合は登録できないこと' do
        @user.email = nil
        @user.valid?

        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordがない場合は登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameがない場合は登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_nameがない場合は登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_name_kanaがない場合は登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'family_name_kanaがない場合は登録できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'birth_dayがない場合は登録できないこと' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it 'emailに@とドメインがない場合は登録できないこと ' do
        @user.save
        another_user = FactoryBot.build(:user, email: 'kkkgmail')
        another_user.valid?
        expect(another_user.errors[:email]).to include("is invalid")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it ' passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが数字のみの場合は登録できない" do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
  
      it "passwordが英文字のみの場合は登録できない" do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "family_nameが数字を含む場合登録できない" do
        @user.family_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "first_nameが数字を含む場合登録できない" do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid" )
      end

      it "first_name_kanaが数字を含む場合登録できない" do
        @user.first_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it "family_name_kanaが数字を含む場合登録できない" do
        @user.family_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
    end
  end
end
