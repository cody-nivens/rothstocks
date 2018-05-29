class Holding < ApplicationRecord
  belongs_to :holding, polymorphic: true
  belongs_to :portfolio

  validates_presence_of :holding
end
