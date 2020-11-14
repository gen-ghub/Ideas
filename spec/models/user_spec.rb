require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'imageが空でも登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
      it 'skillが空でも登録できる' do
        @user.skill = nil
        expect(@user).to be_valid
      end
      it 'positionが空でも登録できる' do
        @user.position = nil
        expect(@user).to be_valid
      end
      it 'profileが空でも登録できる' do
        @user.profile = nil
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'b12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end


    end
  end
end
