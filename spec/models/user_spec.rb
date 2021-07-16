require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録が可能な時' do

      it '全ての項目の入力値が存在する時' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上の時' do
        @user.password = 'yb1007'
        @user.password_confirmation = 'yb1007'
        expect(@user).to be_valid
      end

    end

    context '新規登録が不可能な時' do

      context '各項目の値が空の時' do

        it 'nicknameが空の時' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
  
        it 'emailが空の時' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
  
        it 'passwordが空の時' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
  
        it 'last_nameが空の時' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
  
        it 'first_nameが空の時' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end
  
        it 'last_name_readingが空の時' do
          @user.last_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading can't be blank")
        end
  
        it 'first_name_readingが空の時' do
          @user.first_name_reading = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading can't be blank")
        end
  
        it 'birthdayが空の時' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end

      context 'ユーザー情報のバリデーションに該当する時' do

        it '重複したemailが存在する時' do  
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'passwordが5文字以下の時' do
          @user.password ='yb107'
          @user.password_confirmation ='yb107'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordとpassword_confirmationが不一致の時' do
          @user.password = 'test0000'
          @user.password_confirmation = 'yabeb1007'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが全角の英数字混合の時' do
          @user.password = 'ｙｂ１００７'
          @user.password_confirmation = 'ｙｂ１００７'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end

        it 'passwordが英字のみの時' do
          @user.password = 'yabebe'
          @user.password_confirmation = 'yabebe'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end 

        it 'passwordが数字のみの時' do
          @user.password = '000000'
          @user.password_confirmation = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
        end 
      end

      context '本人情報確認のバリデーションに該当する時' do

        it 'last_nameとfirst_nameのどちらかが空の時' do
          @user.last_name = ''
          @user.first_name
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
        end

        it 'last_nameが半角入力の時' do
          @user.last_name = 'ｲﾄｳ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
        end

        it 'last_nameが英字の時' do
          @user.last_name = 'ito'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
        end

        it 'last_nameが数字の時' do
          @user.last_name = '0000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters")
        end

        it 'first_nameが半角入力の時' do
          @user.first_name = 'ﾕﾒﾉ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
        end

        it 'first_nameが英字の時' do
          @user.first_name = 'ito'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
        end

        it 'first_nameが数字の時' do
          @user.first_name = '0000'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters")
        end

        it 'last_name_readingとfirst_name_readingのどちらかが空の時' do
          @user.last_name_reading = ''
          @user.first_name_reading
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters")
          end
  
        it 'last_name_readingが半角入力の時' do
          @user.last_name_reading = 'ｲﾄｳ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters")
        end
  
        it 'last_name_readingが英字の時' do
          @user.last_name_reading = 'ito'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters")
        end
  
        it 'last_name_readingが数字の時' do
          @user.last_name_reading = '0000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters")
        end
  
        it 'first_name_readingが半角入力の時' do
          @user.first_name_reading = 'ﾕﾒﾉ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters")
        end
  
        it 'first_name_readingが英字の時' do
          @user.first_name_reading = 'ito'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters")
        end
  
        it 'first_name_readingが数字の時' do
          @user.first_name_reading = '0000'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters")
        end

      end
    end
  end

end