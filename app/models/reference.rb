class Reference < ActiveRecord::Base
  attr_accessible :name, :thinker_id
  belongs_to :thinker
end
