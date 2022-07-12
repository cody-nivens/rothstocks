class CreateHistoricalPrices < ActiveRecord::Migration[6.1]
  def change
    create_table :historical_prices do |t|
      t.bigint :stock_id
      t.date :date
      t.float :open
      t.float :close
      t.float :high
      t.float :low
      t.float :volume
      t.float :u_open
      t.float :u_close
      t.float :u_low
      t.float :u_high
      t.float :u_volume
      t.float :change
      t.float :change_percent
      t.string :label
      t.float :change_over_time

      t.timestamps
    end
  end
end
