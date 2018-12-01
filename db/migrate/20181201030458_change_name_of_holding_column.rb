class ChangeNameOfHoldingColumn < ActiveRecord::Migration[5.2]
  def change
      rename_column :holdings, :holding_id, :held_id
      rename_column :holdings, :holding_type, :held_type
  end
end
