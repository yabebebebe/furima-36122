require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/comment.png')
      @item.save
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '商品購入情報の保存が可能な時' do

      it '各項目の入力値が適切に存在する時' do
        expect(@order_address).to be_valid
      end

      it '任意のbuilding_nameが空の時' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end

      it 'phoneが下限10桁の時' do
        @order_address.phone = '1234567890'
        expect(@order_address).to be_valid
      end

    end

    context '商品購入情報の保存が不可能な時' do

      it 'userが結びついて無い時' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが結びついてない時' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      context '必須項目の各入力値が空の時' do

        it 'postal_codeが空の時' do
          @order_address.postal_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'prefecture_idが空の時' do
          @order_address.prefecture_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'cityが空の時' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it 'house_numberが空の時' do
          @order_address.house_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end

        it 'phoneが空の時' do
          @order_address.phone = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is invalid. Input only number")
        end

        it 'tokenが空の時' do
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

      end

      context 'バリデーションに該当する時' do

        it 'postal_codeが全角入力の時' do
          @order_address.postal_code = '２７３−００２４'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'postal_codeが文字入力の時' do
          @order_address.postal_code = 'ｱｱｱｰｱｱｱｱ'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'postal_codeが「-」を含まない時' do
          @order_address.postal_code = '2730024'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
        end

        it 'prefecture_idが「--」の時' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'phoneが10桁未満の時' do
          @order_address.phone = '123456789'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is invalid. Input only number")
        end

        it 'phoneが11桁より上の時' do
          @order_address.phone = '123456789012'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is invalid. Input only number")
        end

        it 'phoneが英数混合の時' do
          @order_address.phone = '12345abcde'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone is invalid. Input only number")
        end

      end
      
    end

  end
end