class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  rolify
  has_many :courses

  def username
    self.email.split(/@/).first
  end

  def to_s
    email
  end

  private
    ransacker :sign_in_count do
      Arel.sql("to_char(\"#{table_name}\".\"sign_in_count\", '99999')")
    end
end
