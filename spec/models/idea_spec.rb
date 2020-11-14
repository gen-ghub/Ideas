require 'rails_helper'
describe Idea do
  before do
    @idea = FactoryBot.build(:idea)
  end


  describe '募集投稿機能' do
    context '募集投稿がうまくいくとき' do
      it 'title,tag_id,text,imageが存在すれば登録できる' do
        expect(@idea).to be_valid
      end
      it 'imageが空でも登録できる' do
        @idea.image = nil
        expect(@idea).to be_valid
      end
    end

    context '募集投稿がうまくいかないとき' do
      it 'titleが空だと登録できない' do
        @idea.title = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'tag_idが--では登録できない' do
        @idea.tag_id = 1
        @idea.valid?
        expect(@idea.errors.full_messages).to include('カテゴリは「--」以外を選択してください')
      end
      it 'textが空では登録できない' do
        @idea.text = nil
        @idea.valid?
        expect(@idea.errors.full_messages).to include("アイデアを入力してください")
      end

    end
  end
end
