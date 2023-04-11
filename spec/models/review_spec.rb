require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe 'レビュー投稿' do
    context 'レビューが投稿できる場合' do
      it '全ての項目が存在していれば保存できる' do
        expect(@review).to be_valid
      end
      it 'textが空でも保存できる' do
        @review.text = ''
        expect(@review).to be_valid
      end
    end
    context 'レビューが投稿できない場合' do
      it 'totalが空では保存できない' do
        @review.total = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Total can't be blank")
      end
      it 'conceptが空では保存できない' do
        @review.concept = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Concept can't be blank")
      end
      it 'qualityが空では保存できない' do
        @review.quality = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Quality can't be blank")
      end
      it 'usabilityが空では保存できない' do
        @review.usability = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Usability can't be blank")
      end
      it 'utilityが空では保存できない' do
        @review.utility = ''
        @review.valid?
        expect(@review.errors.full_messages).to include("Utility can't be blank")
      end
      it 'postが紐付いていないと保存できない' do
        @review.post = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('Post must exist')
      end
      it 'userが紐付いていないと保存できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('User must exist')
      end
    end
  end
end
