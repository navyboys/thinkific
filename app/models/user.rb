# frozen_string_literal: true

class User < ApplicationRecord
  before_create :generate_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )

    user
  end

  private

  def generate_token
    # begin
    #   self.token = SecureRandom.hex
    # end while self.class.exists?(token: token)

    loop do
      self.token = SecureRandom.hex
      break self.class.exists?(token: token)
    end
  end
end
