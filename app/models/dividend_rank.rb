class DividendRank < ApplicationRecord
  belongs_to :stock
  belongs_to :sector
  belongs_to :industry

end
