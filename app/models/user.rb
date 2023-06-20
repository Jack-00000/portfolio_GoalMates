class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  validates :status, presence: true
         
  has_one_attached :profile_image
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
