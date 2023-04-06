require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nameが空だと登録できない" do
      user = User.new(name: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(name: "abe", email: "", password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと登録できない' do
      user = User.new(name: "abe", email: "kkk@gmail.com", password: "", password_confirmation: "00000000")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationがpasswordと一致しないと登録できない' do
      user = User.new(name: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "")
      user.valid? 
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  end
end
