class Holding < ApplicationRecord
  belongs_to :holding, polymorphic: true
  belongs_to :portfolio
end
