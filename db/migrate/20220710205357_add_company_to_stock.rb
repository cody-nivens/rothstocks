class AddCompanyToStock < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :company_id, :bigint
  end
end
