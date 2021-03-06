class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  attachment :image

  has_many :items
  has_many :comments
  has_many :likes

  validates :email, presence: true
  validates :name, presence: true
  validates :username, presence: true

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        name:     auth.info.email,
        username: auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

end
