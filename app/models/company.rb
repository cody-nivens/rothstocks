class Company < ApplicationRecord
  belongs_to :stock
  belongs_to :industry
  belongs_to :sector

  acts_as_taggable_on :tags

end
