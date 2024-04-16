class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: { message: '内容を入力してください' }
  
end
