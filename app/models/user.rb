class User < ApplicationRecord
  # 書く順番
  # ①アソシエーション（belongs_toなど）
  # ②gemなどの関数や他の定義
  # ③AttributeMethodsモジュール
  # ④attr関連
  # ⑤バリデーション
  # ⑥コールバック

  # 関連付け
  has_many :reviews, dependent: :destroy
  has_many :petsitters, through: :reviews
  has_many :likes, dependent: :destroy
  has_many :liked_petsitters, through: :likes, source: :petsitter

  # bcryptによるパスワード検証
  has_secure_password
  # 画像投稿用（carrierwave使用）
  mount_uploader :image, ImageUploader

  # email用の正規表現
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Validation
  # unless: :uid?はSNSログインの有無（uidありの場合は通常のログインとは異なるため、validationも変更させています）
  validates :name, { presence: true, length: { maximum: 30 }} unless :uid?
  validate :validate_name_not_including_comma
  validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
  validates :password, presence: true unless :uid?
  validates :password_digest, presence: true unless :uid?

  # email保存前に小文字に変換処理を行う
  before_save { self.email = email.downcase }

  #auth hashからユーザ情報を取得
  #データベースにユーザが存在するならユーザ取得して情報更新する；存在しないなら新しいユーザを作成する
  def self.find_or_create_from_auth(auth)
    # emailが登録あれば、関連するユーザー情報を使用
    user = User.find_by(email: auth.info.email)

    # 新規ユーザー作成のための情報
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    email = auth[:info][:email]
    image = auth[:info][:image]
    password = SecureRandom.hex(20)

    # 登録email（ユーザー）見つからない場合、api情報を基にユーザー作成
    unless user
      # 新規ユーザー作成
      user = User.create(name: name,
                         email: email,
                         password: password,
                         password_confirmation: password,
                         image: image,
                         provider: provider,
                         uid: uid,)
    end

    # いいねが既にあるかどうかを判定（petsitters/show.html.erbで使用）
    def already_liked?(petsitter)
      self.likes.exists?(petsitter_id: petsitter.id)
    end

    # 更新している場合、名前などを編集。
    # また、何経由でログインしたのかを表示できるように、snsログインの場合、providerも都度更新
    if provider != nil && uid != nil
      user.name = name
      user.image = image
      user.provider = provider
    end

    # ユーザーを返却
    user
  end

  private
    def validate_name_not_including_comma
      errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
    end

end
