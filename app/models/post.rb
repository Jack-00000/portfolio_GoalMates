class Post < ApplicationRecord
  validates :goal, presence: true, length: { maximum: 30 }
  validates :action, presence: true, length: { maximum: 100 }

  has_one_attached :image

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post

  has_many :comments, dependent: :destroy

  #引数で渡されたユーザidがFavoritesテーブル内に存在するか確認する
  def favorited_by?(user)
    #後置修飾の"if user"は記述しないと非ログイン時にいいね機能のある画面を表示できないため記述
    favorites.exists?(user_id: user.id) if user
  end

  #メニュー名を曖昧検索するためのメソッド
  def self.search_for(content)
    if content != nil
      where('menu LIKE ?', '%' + content + '%').order(created_at: :desc)
    else
      order(created_at: :desc)
    end
  end

end
