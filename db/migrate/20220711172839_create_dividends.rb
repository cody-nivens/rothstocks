class CreateDividends < ActiveRecord::Migration[6.1]
  def change
    create_table :dividends do |t|
      t.bigint :stock_id
      t.date :ex_date
      t.date :payment_date
      t.date :record_date
      t.date :declared_date
      t.float :amount
      t.string :currency
      t.string :description
      t.string :frequency
      t.date :date

      t.timestamps
    end
  end
end
