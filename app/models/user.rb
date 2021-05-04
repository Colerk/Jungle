class User < ActiveRecord::Base

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 4 }

  def authenticate_with_credentials(email, password)
    user = User.where("lower(email) = ?", email.downcase.strip).first
    if user.authenticate(password)
      user
    else
      nil
    end
  end

end
