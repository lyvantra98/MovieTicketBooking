class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: Settings.val_name_max }
  validates :email, presence: true, length: { maximum: Settings.val_email_max },
                    format: { with: Settings.email_regex },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: Settings.val_pass_min }
  validates :phone, presence: true, length: { maximum: Settings.val_phone_max },
                    format: { with: Settings.phone_regex }
  before_save :email_downcase
  has_secure_password
  enum role: {user: 0, admin: 1}

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  private

  def email_downcase
    email.downcase!
  end
end
