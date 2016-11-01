class Thinker < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 50},
	          format: { with: VALID_EMAIL_REGEX }, allow_blank: true
	acts_as_taggable_on :topics
	has_many :references
  has_and_belongs_to_many :topics
end
