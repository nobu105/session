class Item < ApplicationRecord
	mount_uploader :file, AudioFileUploader
	
	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  validates :title, presence: true
  validates :text, presence: true
  validates :file, presence: true

	def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Item.where(['title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Item.all
    end
  end
end
