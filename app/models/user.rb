class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image, dependent: :destroy
  has_many :ideas, dependent: :destroy

  validates :name,presence: true

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :likes, dependent: :destroy

  def liked_by?(idea_id)
    likes.where(idea_id: idea_id).exists?
  end
end

