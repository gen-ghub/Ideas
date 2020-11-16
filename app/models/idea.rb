class Idea < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :tag

  belongs_to :user
  has_one_attached :image
  has_many :likes

  with_options presence: true do
    validates :title
    validates :text
  end

  validates :tag_id,numericality: { other_than: 1, message: 'は「--」以外を選択してください' }
end
