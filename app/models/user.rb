class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 6}

  def self.authenticate_with_credentials(email, password)
    new_email = email.strip
    lower_email = new_email.downcase
    user = User.find_by_email(lower_email)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end

