require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録/ユーザー情報' do
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
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = 'test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英数字混合でなければ登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Include both letters and numbers")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'a12345'
      @user.password_confirmation = 'a123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe 'ユーザー情報/本人情報確認' do
    it 'name_seiが空では登録できない' do
      @user.name_sei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei can't be blank")
    end
    it 'name_meiが空では登録できない' do
      @user.name_mei = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei can't be blank")
    end
    it 'name_seiが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
      @user.name_sei = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei is invalid. Input full-width characters")
    end
    it 'name_meiが全角(漢字・ひらがな・カタカナ)でなければ登録できない' do
      @user.name_mei = 'Takashi'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei is invalid. Input full-width characters")
    end
    it 'name_sei_kanaが空では登録できない' do
      @user.name_sei_kana = ''
      @user.valid?
      expect("Name sei kana can't be blank")
    end
    it 'name_mei_kanaが空では登録できない' do
      @user.name_mei_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei kana can't be blank")
    end
    it 'name_sei_kanaが全角(カタカナ)でなければ登録できない' do
      @user.name_sei_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name sei kana is invalid. Input full-width katakana characters")
    end
    it 'name_mei_kanaが全角(カタカナ)でなければ登録できない' do
      @user.name_mei_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name mei kana is invalid. Input full-width katakana characters")
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
