require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が正しく入力されてあれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれていない場合登録できない" do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user.email = @user.email
        another_user.valid? 
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "name_secondが空では登録できない" do
        @user.name_second = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "name_firstが空では登録できない" do
        @user.name_first = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end
      it "last_nameとfirst_nameが半角文字だと登録できない" do
        @user.name_second = "yamada"
        @user.name_first = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
      end
      it "kana_secondが空だと登録できない" do
        @user.kana_second = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end
      it "kana_firstが空だと登録できない" do
      @user.kana_first = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end
      it "last_name_kanaとfirst_name_kanaがカタカナでないと登録できない" do
        @user.kana_second = "yamada"
        @user.kana_first = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid", "First name kana is invalid")
      end
      it "birthが空では登録できない" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
