require 'securerandom'

module DigestUtil

  def self.encrypt(data)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    return BCrypt::Password.create(data, cost: cost)
  end

  def self.random_base64_32
    return SecureRandom.urlsafe_base64(32)
  end

  # des加密
  def self.encryptDES(context)
    key = 'i5Im!8Fr'
    cipher = OpenSSL::Cipher::DES.new.encrypt.tap { |obj| obj.key = obj.iv = key }
    (cipher.update(context) + cipher.final).unpack1('H*').upcase
  end

  # des解密
  def self.decryptDES(context)
    key = 'i5Im!8Fr'
    cipher = OpenSSL::Cipher::DES.new.decrypt.tap { |obj| obj.key = obj.iv = key }
    cipher.update([context].pack('H*')) + cipher.final
  end

  def self.md5(data)
    # 加盐密码
    Digest::MD5.hexdigest("J@5B^56FRc!^Dyi#{data}XqA9&Nkw6MWjmRX")
  end
end