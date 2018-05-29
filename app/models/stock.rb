class Stock < ApplicationRecord
  belongs_to :industry
  belongs_to :sector
   validates_uniqueness_of :symbol
   validates_presence_of :symbol
   validates_presence_of :name
end
