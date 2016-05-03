class Reference < ActiveRecord::Base
  belongs_to :thinker
  validates :publishing_year, presence: true, numericality: { only_integer: true }
  validates :title, presence: true
  validates :place_of_publication, presence: true
end
