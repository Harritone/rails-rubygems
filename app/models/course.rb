class Course < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5 }
  validates :short_description, :level, :language, :price, presence: :true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :description, presence: :true, length: {minimum:5} 

  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_many :enrollments

  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged

  include PublicActivity::Model
  tracked owner: Proc.new {|controller, model| controller.current_user}


  LEVELS = [:"Begginer", :"Intermediate", :"Advanced"]

  def to_s
    title
  end

  def self.levels
    LEVELS.map { |level| [level, level] }
  end

  LANGUAGES = [:"English", :"Russian", :"Polska", :"French"]

  def self.languages
    LANGUAGES.map { |language| [language, language] }
  end

  def bought(user)
    self.enrollments.where(user_id: [user.id], course_id: [self.id].empty?)
  end

end
