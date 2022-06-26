require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品を購入できるとき' do
      it '必要な情報を適切に入力すれば商品を購入できる' do
        expect(@record_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @record_address.building = ''
        expect(@record_address).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'トークンが空では購入できない' do
        @record_address.token = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便局番号が空では購入できない' do
        @record_address.postal_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンなしでは購入できない' do
        @record_address.postal_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号が全角数字では購入できない' do
        @record_address.postal_code = '１２３-４５６７'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県に「---」が選択されていると購入できない' do
        @record_address.prefecture_id = 0
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できない' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では購入できない' do
        @record_address.address = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @record_address.tell = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Tell can't be blank")
      end
      it '電話番号にハイフンが入っていては購入できない' do
        @record_address.tell = '090-1234-5678'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Tell is invalid. Input only number')
      end
      it '電話番号が全角数字では購入できない' do
        @record_address.tell = '０８０１２３４５６７８'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Tell is invalid. Input only number')
      end
      it '電話番号が9桁以下では購入できない' do
        @record_address.tell = '123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Tell is invalid. Input only number')
      end
      it '電話番号が12桁以上では購入できない' do
        @record_address.tell = '123456789012'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Tell is invalid. Input only number')
      end
      it 'ユーザーが紐付いていなければ購入できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it '商品が紐付いていなければ購入できない' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
