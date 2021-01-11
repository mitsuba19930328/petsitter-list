class TempSave < ApplicationRecord
  belongs_to :user
  belongs_to :petsitter
  validates :user_id, presence: true
  validates :petsitter_id, presence: true

  # ユーザーid×ペットシッターidの組は重複しないようにする
  validates_uniqueness_of :petsitter_id, scope: :user_id
end
