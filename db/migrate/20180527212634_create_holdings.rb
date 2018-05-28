class CreateHoldings < ActiveRecord::Migration[5.1]
  def change
    create_table :holdings do |t|
      t.references :holding, polymorphic: true
      t.float :price
      t.float :quantity
      t.datetime :date
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
