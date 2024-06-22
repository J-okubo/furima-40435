require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員情報入力' do
    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, first_name_zen, last_name_zen, first_name_han, last_name_han, date_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '会員情報入力できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'First nameが全角ではないと登録できない' do
        @user.first_name_zen = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name zen Input full-width characters')
      end

      it 'First nameが空白では登録できない' do
        @user.first_name_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zen can't be blank")
      end

      it 'Last nameが全角ではないと登録できない' do
        @user.last_name_zen = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name zen Input full-width characters')
      end

      it 'Last nameが空白では登録できない' do
        @user.last_name_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name zen can't be blank")
      end

      it 'First name kanaがカナ文字ではないと登録できない' do
        @user.first_name_han = 'あかさたな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name han Input full-width katakana characters')
      end

      it 'First name kanaが空白では登録できない' do
        @user.first_name_han = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name han can't be blank")
      end

      it 'Last name kanaがカナ文字ではないと登録できない' do
        @user.last_name_han = 'akasatana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name han Input full-width katakana characters')
      end

      it 'Last name kanaが空白では登録できない' do
        @user.last_name_han = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name han can't be blank")
      end

      it 'Date of birthが空白では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが6文字以下では登録できない' do
        @user.password = '0000'
        @user.password_confirmation = '0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字のみのパスワードでは登録できない' do
        @user.password = 'abc'
        @user.password_confirmation = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角文字を含むパスワードでは登録できない ' do
        @user.password = '全角文字12c'
        @user.password_confirmation = '全角文字12c'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end
