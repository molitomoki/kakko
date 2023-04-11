require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'サイトを投稿' do
    context '新規作成できる場合' do
      it "titleとimageとurlが存在すれば作成できる" do
        expect(@post).to be_valid

      end
    end
    context '新規作成できない場合' do
      it "titleが空では作成できない" do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it "urlが空では作成できない" do
        @post.url = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Url can't be blank")
      end
      it "imageが空では作成できない" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
