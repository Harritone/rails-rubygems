class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  rolify

  has_many :courses

  after_create :assign_default_role

  def assign_default_role
    if User.count == 1
      self.add_role(:admin) if self.roles.blank?
      self.add_role(:teacher) 
      self.add_role(:student) 
    else
      self.add_role(:student) if self.roles.blank?
      self.add_role(:teacher) 
    end
  end

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
