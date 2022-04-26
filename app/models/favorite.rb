class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :book
  validates_uniqueness_of :book_id, scope: :user_id
  # ユーザーは一つの投稿に対して一つのいいねしか押せないという制限
  #  validates :book_id, uniqueness: trueだと投稿に対して一つしかいいねが押せない

end
