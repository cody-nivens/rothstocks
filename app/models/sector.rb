class Sector < ApplicationRecord
     has_many :stocks
     has_many :industries
     has_many :dividend_ranks

	 validates_uniqueness_of :name
	 validates_presence_of :name
end
