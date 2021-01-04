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
      
  end
end
