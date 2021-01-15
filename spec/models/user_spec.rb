require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が正しく入力されてあれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが英語だけだと登録できない' do
        @user.password = 'asdfgh'
        @user.password_confirmation = 'asdfgh'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password = '000000'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'name_secondが空では登録できない' do
        @user.name_second = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name second can't be blank", 'Name second is invalid')
      end
      it 'name_firstが空では登録できない' do
        @user.name_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank", 'Name first is invalid')
      end
      it 'name_secondとname_firstが半角文字だと登録できない' do
        @user.name_second = 'yamada'
        @user.name_first = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name second is invalid', 'Name first is invalid')
      end
      it 'kana_secondが空だと登録できない' do
        @user.kana_second = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana second can't be blank", 'Kana second is invalid')
      end
      it 'kana_firstが空だと登録できない' do
        @user.kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first can't be blank", 'Kana first is invalid')
      end
      it 'kana_secondとkana_firstがカタカナでないと登録できない' do
        @user.kana_second = 'yamada'
        @user.kana_first = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana second is invalid', 'Kana first is invalid')
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
