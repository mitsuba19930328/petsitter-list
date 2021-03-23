class Review < ApplicationRecord
  # 書く順番
  # ①アソシエーション（belongs_toなど）
  # ②gemなどの関数や他の定義
  # ③AttributeMethodsモジュール
  # ④attr関連
  # ⑤バリデーション
  # ⑥コールバック

  belongs_to :user
  belongs_to :petsitter
  validates :petsitter_id, uniqueness: {message: "同じペットシッターへの複数回投稿はできません。"}, on: :create

end
