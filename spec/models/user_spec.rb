require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '#create' do
    it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      expect(user).to be_valid
    end

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

    it ' passwordが6文字以上であれば登録できること ' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it ' passwordが5文字以下であれば登録できないこと ' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
  end
end
