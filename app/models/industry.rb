class Industry < ApplicationRecord
  belongs_to :sector

  has_many :stocks
  has_many :dividend_ranks

  validates_presence_of :name
end
