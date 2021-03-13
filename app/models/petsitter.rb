class Petsitter < ApplicationRecord
  # 書く順番
  # ①アソシエーション（belongs_toなど）
  # ②gemなどの関数や他の定義
  # ③AttributeMethodsモジュール
  # ④attr関連
  # ⑤バリデーション
  # ⑥コールバック

  # 関連付け
  has_many :reviews, dependent: :destroy
  has_many :users, through: :reviews
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :temp_save, dependent: :destroy
  has_many :temp_saved_users, through: :temp_save, source: :user

  # 画像投稿用（carrierwave使用）
  mount_uploader :image, ImageUploader

  # Validation
  validates :name, { presence: true, length: { maximum: 30 }}
  validate :validate_name_not_including_comma

  private
  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
