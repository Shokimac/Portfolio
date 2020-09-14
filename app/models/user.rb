class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  attachment :image
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :omniauthable,
         omniauth_providers: [:google_oauth2]

  has_many :episodes, dependent: :destroy
  has_many :episode_favorites, dependent: :destroy
  has_many :episode_bookmarks, dependent: :destroy
  has_many :proverbs, dependent: :destroy
  has_many :proverb_favorites, dependent: :destroy
  has_many :proverb_bookmarks, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def active_for_authentication?
    super && (self.delete_flg === false)
  end
  
  protected
  # 以下を追加
    def self.from_omniauth(access_token)
      data = access_token.info
      user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
    end
end
