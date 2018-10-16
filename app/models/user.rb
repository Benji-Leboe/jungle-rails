class User < ActiveRecord::Base
  
  def self.authenticate_with_credentials(email, password)
    sani_email = email.delete(' ').downcase
    @user = User.find_by_email(sani_email)
    @user.authenticate(password)
  end

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 5 }, confirmation: true
  validates :password_confirmation, presence: true

  private 

  before_save { self.email = email.downcase }
end
