class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.bigint :stock_id
      t.string :exchange
      t.bigint :industry_id
      t.text :website
      t.text :description
      t.string :ceo
      t.string :security_name
      t.string :issue_type
      t.bigint :sector_id
      t.integer :employees

      t.timestamps
    end
  end
end
