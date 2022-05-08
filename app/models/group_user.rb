class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  # 削除機能をつけていないからdependent: :destroyなし
end
