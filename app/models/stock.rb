class Stock < ApplicationRecord
  belongs_to :industry
  belongs_to :sector
end
