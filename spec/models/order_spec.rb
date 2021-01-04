require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it '全ての入力条件を満たしたら送信できること' do
        expect(@order).to be_valid
      end
    end
  end
end
