class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+\.in\z/, message: "must be a .in account" }
  validate :password_complexity
  #validate :user_entry
  validates_format_of :username, :with => /\A(flexiple_)+[a-z_]+\Z/

  def password_complexity
    if password.present? and not password.match(/^(?=.*[\W].*[\W])(?=.*[A-Z].*[A-Z]).{4,8}$/)
      errors.add :password, "must include at least one special character, two uppercase letter or minimum length is 4 or maximium length is 8"
    end
  end
  
end
