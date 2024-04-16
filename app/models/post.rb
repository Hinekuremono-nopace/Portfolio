class Post < ApplicationRecord

  belongs_to :user

  has_rich_text :content

  has_many :comments

  validates :title, presence: { message: 'タイトルを入力してください' }
  validates :content, presence: { message: '内容を入力してください' }

  # 検索キーワードに一致する記事を返すスコープ
  scope :search, -> (keyword) { where("title LIKE ?", "%#{keyword}%") }

end
