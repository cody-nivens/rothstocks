class AddSectorAndIndustryToDividendRank < ActiveRecord::Migration[5.2]
  def change
    add_column :dividend_ranks, :sector_id, :integer
    add_column :dividend_ranks, :industry_id, :integer

  #  DividendRank.all.each do |dr|
  #    dr.update_attribute(:sector_id, dr.stock.sector_id)
  #    dr.update_attribute(:industry_id, dr.stock.industry_id)
  #  end
  end
end
