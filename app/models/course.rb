class Course < ApplicationRecord
  extend FriendlyId
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
end
