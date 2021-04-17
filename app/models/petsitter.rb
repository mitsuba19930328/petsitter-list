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

  # phone用の正規表現
  VALID_PHONE_REGEX = /\A[0-9]{2,3}[-0-9][0-9]{3,4}[-0-9][0-9]+\z/i

  # Validation
  validates :name, { presence: true, length: { maximum: 30 }}
  validates :address, { presence: true}
  validates :prefecture, { presence: true}
  validates :town, { presence: true}
  validates :phone, { presence: true, length: { maximum: 15 }, format: { with: VALID_PHONE_REGEX }}
  validates :pet_type, { presence: true}
  validates :insurance, { presence: true}
  validate :validate_name_not_including_comma

  private
  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end
end
