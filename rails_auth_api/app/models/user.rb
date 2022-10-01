class User < ApplicationRecord
  has_secure_password

  attr_reader :password

  def self.not_exists?(data)
    self.where(data).blank?
  end

  def password_method(unencrypted_password)
    if unencrypted_password.blank?
      self.password_digest = nil
    else
      @password = unencrypted_password;
      self.password_digest = DigestUtil.encrypt(unencrypted_password)
    end
  end

  def generateJwt
    payload = { user_id: self.id, exp: (Time.new + 2.hours).to_i }
    JWT.encode payload,'91ea5985-7228-4907-918f-1f4a59eee94e', "HS256"
  end



  def authenticate?(attribute, value)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    # 使用传递进来的密码和加密密码进行比较
    # 如果成功返回true，否则返回false

    BCrypt::Password.new(digest).is_password?(value)
  end

end
