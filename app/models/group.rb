class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, presence: true

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  # ファインプレイ！
end
