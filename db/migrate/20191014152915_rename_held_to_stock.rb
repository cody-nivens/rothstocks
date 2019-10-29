class RenameHeldToStock < ActiveRecord::Migration[5.2]
  def change
    rename_column :holdings, :held_id, :stock_id
    remove_column :holdings, :held_type
  end
end
