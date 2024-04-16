class User < ApplicationRecord
  # Deviseの設定
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # ユーザーが削除された時に関連する投稿とコメントも削除する
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
