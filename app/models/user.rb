class User < ActiveRecord::Base
  include Clearance::User
  mount_uploader :avatar, AvatarUploader

  has_many :authentications, dependent: :destroy
  has_many :listings, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :payments

  validates :description, length: { maximum: 140 }

  def new_token
    SecureRandom.urlsafe_base64
  end
  # creates a user with authentication hash returned from provider
  def self.create_with_auth_and_hash(authentication, auth_hash)
    # authentication(variable) is authentication object
    create! do |user|
      user.first_name = auth_hash['info']['first_name'] || 'first_name'
      user.last_name = auth_hash['info']['last_name'] || 'last_name'
      user.email = auth_hash['extra']['raw_info']['email']
      user.gender = auth_hash['extra']['raw_info']['gender']
      user.encrypted_password = user.new_token
      user.remember_token = user.new_token
      user.authentications << authentication
    end
  end

  # return facebook token
  def facebook_token
    fb_auth = authentications.where(provider: :facebook).first
    fb_auth.token unless fb_auth.nil?
  end

  # override clearance default
  def password_optional?
    true
  end

end
