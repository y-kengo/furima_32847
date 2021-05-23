require 'rails_helper'

RSpec.describe OrderAddress, type: :model do

  
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address,user_id: user.id, item_id: item.id)
      sleep(1)
    end

    describe '商品の購入' do
    context '商品の購入記録がされる時' do
        it '全ての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end

        it '建物名がなくても保存できること' do
          @order_address.building = ''
          expect(@order_address).to be_valid
        end

    end

     context '商品の購入記録が保存されない時' do
        it "tokenが空では登録できないこと" do
          @order_address.postal_code = 'nill'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code  Input correctly")
        end

        it '郵便番号が空では保存できないこと' do
          @order_address.postal_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code  Input correctly")
        end

        it '郵便番号にハイフンがないと保存できないこと' do
          @order_address.postal_code = '1234567'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code  Input correctly")
        end

        it '都道府県を選択しないと保存できないこと' do
          @order_address.area_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Area Select")
        end

        it '市町村の入力がないと保存できないこと' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it '電話番号が空だと保存できないこと' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number Input only number")
        end

        it '電話番号に数値以外があると保存できないこと' do
          @order_address.phone_number = 'yyyyyyyyyyy'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number Input only number")
        end

        it '電話番号が12桁以上では登録できないことと' do
          @order_address.phone_number = '123456789101112'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number Input only number")
        end

        it '電話番号が英数混合では登録できないこと' do
          @order_address.phone_number = "0r9t8y8u7io"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number Input only number")
        end

        it 'user_idが空の場合登録できないこと' do
          @order_address.user_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空の場合登録できないこと' do
          @order_address.item_id = ""
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
# end

