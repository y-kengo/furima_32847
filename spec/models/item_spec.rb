require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "出品機能" do
    context '出品ができる時' do
      it '必須項目が入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録ができない時' do  
      it "nameがない場合は登録できないこと" do
        @item.name = ''
        @item.valid?
        expect(@item.errors[:name]).to include("can't be blank")
      end

      it "descriptionがない場合は登録できないこと" do
        @item.description = ''
        @item.valid?
        expect(@item.errors[:description]).to include("can't be blank")
      end

      it "category_idがない場合は登録できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("must be other than 1")
      end

      it "shipping_idがない場合は登録できないこと" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors[:shipping_id]).to include("must be other than 1")
      end

      it "status_idがない場合は登録できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors[:status_id]).to include("must be other than 1")
      end

      it "day_idがない場合は登録できないこと" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors[:day_id]).to include("must be other than 1")
      end

      it "area_idがない場合は登録できないこと" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors[:area_id]).to include("must be other than 1")
      end

      it "priceがない場合は登録できないこと" do
        @item.price = ''
        @item.valid?
        expect(@item.errors[:price]).to include("can't be blank", "is invalid", "is not a number")
      end

      it "priceが299以下だと登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include("must be greater than or equal to 300")
      end

      it "priceが10000000だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
      end

      it "priceが半角数字以外保存できない" do
        @item.price = '２２２２２２２'
        @item.valid? 
        expect(@item.errors[:price]).to include("is not a number")
      end

      it "priceが半角英数混合では登録できない" do
        @item.price = '111eeee'
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end

      it "priceが半角英語だけでは登録できない" do
        @item.price = 'uuuuuuu'
        @item.valid?
        expect(@item.errors[:price]).to include("is not a number")
      end

      it "imageが空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors[:image]).to include("can't be blank")
      end

    end
  end
end

