class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
  validates :status, presence: true
  
  has_one_attached :profile_image
  
  enum status: { released: 0, nonreleased: 1, withdraw: 2 }

  #ユーザーステータスが”退会”以外のユーザーをユーザー一覧で表示させるためのscope
  scope :active_user, -> { where(status: 0).or(where(status: 1)) }

  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def active_for_authentication?
    super && (self.status == 'released')
  end

  def self.guest
    find_or_create_by!(name: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end


end