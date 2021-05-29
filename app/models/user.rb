class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Locker

  field :email, type: String
  field :encrypted_password, type: String

  field :locker_locked_at, type: Time
  field :locker_locked_until, type: Time

  locker locked_at_field: :locker_locked_at,
         locked_until_field: :locker_locked_until

  ## Required
  field :provider, type: String
  field :uid,      type: String, default: ''

  ## Tokens
  field :tokens, type: Hash, default: {}

  field :nickname, type: String
  field :full_name, type: String

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  index({ uid: 1, provider: 1 }, { name: 'uid_provider_index', unique: true, background: true })
end
