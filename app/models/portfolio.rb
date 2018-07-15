class Portfolio < ApplicationRecord
  belongs_to :user
  validates_presence_of :name

  has_many :holdings

  def value
    val = 0.0
    self.holdings.each do |holding|
      val += holding.value.to_f
    end
    return val
  end

  def cost
    val = 0.0
    self.holdings.each do |holding|
      val += holding.cost
    end
    return val
  end

end
