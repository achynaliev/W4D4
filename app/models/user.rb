# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: {message: 'Password can\'t be blank'}
  validates :session_token, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    if user
      return user if user.is_password?(password)
    else
      return nil
    end
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end


end
