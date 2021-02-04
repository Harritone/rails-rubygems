class Course < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model
  tracked owner: Proc.new {|controller, model| controller.current_user}

  friendly_id :title, use: :slugged

  # friendly_id :generated_slug, use: :slugged
  # def generated_slug
  #   require 'securerandom'
  #   @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(4)
  # end

  validates :title, presence: true, length: {minimum: 5 }
  validates :short_description, :level, :language, :price, presence: :true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :description, presence: :true, length: {minimum:5} 


  has_rich_text :description

  belongs_to :user

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

end
