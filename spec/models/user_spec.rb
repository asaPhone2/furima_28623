require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    context 'ユーザー新規登録ができる時' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
        expect(user).to be_valid
      end

      it ' passwordが6文字以上であれば登録できること ' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
    end
    
    context 'ユーザー新規登録ができない時' do
      it 'nicknameがない場合は登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end

      it 'emailがない場合は登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end

      it 'passwordがない場合は登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it 'first_nameがない場合は登録できないこと' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it 'family_nameがない場合は登録できないこと' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を入力してください')
      end

      it 'first_name_kanaがない場合は登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前カナを入力してください')
      end

      it 'family_name_kanaがない場合は登録できないこと' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字カナを入力してください')
      end

      it 'birth_dayがない場合は登録できないこと' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end

      it 'emailに@とドメインがない場合は登録できないこと ' do
        @user.create
        another_user = build(:user, email: 'kkkgmail')
        another_user.valid?
        expect(another_user.errors[:email]).to include('は不正な値です')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it ' passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it "passwordが数字のみの場合は登録できない" do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @ser.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字混合で入力してください')
      end
  
      it "passwordが英文字のみの場合は登録できない" do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字混合で入力してください')
      end

      it "first_name、family_name、first_name_kana、family_name_kanaが数字を含む場合登録できない" do
        @user.first_name = '123'
        @user.family_name = '123'
        @user.first_name_kana = '123'
        @user.family_name_kana = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は漢字、平仮名、カタカナのみで、振り仮名は全角カタカナのみで入力してください')
    end
  end
end
