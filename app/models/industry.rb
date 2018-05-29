class Industry < ApplicationRecord
  belongs_to :sector
  validates_presence_of :name
end
