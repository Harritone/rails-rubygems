class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :courses

  private
  ransacker :sign_in_count do
    Arel.sql("to_char(\"#{table_name}\".\"sign_in_count\", '99999')")
  end
end
