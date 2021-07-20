require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/comment.png')
  end

  describe '商品出品' do

    context '商品出品が可能な時' do

      it '全項目の入力値が適切に存在する時' do
        expect(@item).to be_valid
      end

      it 'priceが¥300以上の時' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it 'priceが¥9,999,999以下の時' do
        @item.price = 9999999
        expect(@item).to be_valid
      end

    end

    context '商品出品が不可能な時' do

      it 'ユーザー情報が無い時' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      context '各項目の入力値が空の時' do

        it 'imageが空の時' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end   

        it 'titleが空の時' do
          @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it 'textが空の時' do
          @item.text = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Text can't be blank")
        end

        it 'category_idが空の時' do
          @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'state_idが空の時' do
          @item.state_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end

        it 'charge_idが空の時' do
          @item.charge_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge can't be blank")
        end

        it 'prefecture_idが空の時' do
          @item.prefecture_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'scheduled_delivery_idが空の時' do
          @item.scheduled_delivery_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end 
        
        it 'priceが空の時' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

      end

      context 'ActiveHashの各項目が「--」の時' do

        it 'category_idが「--」の時' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'state_idが「--」の時' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("State can't be blank")
        end

        it 'charge_idが「--」の時' do
          @item.charge_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Charge can't be blank")
        end

        it 'prefecture_idが「--」の時' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end
        
        it 'scheduled_delivery_idが「--」の時' do
          @item.scheduled_delivery_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end

      end

      context '商品価格のバリデーションに該当する時' do

        it 'priceが¥300未満の時' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end 

        it 'priceが¥9,999,999より上の時' do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end

        it 'priceが全角入力の時' do
          @item.price = '１００００'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが全角文字の時' do
          @item.price = '販売価格'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角英数混合の時' do
          @item.price = 'test000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが半角英字のみの時' do
          @item.price = 'test'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it 'priceが数値以外の時' do
          @item.price = 'ｶｶｸ'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end

      end     
    end
  end
  
end