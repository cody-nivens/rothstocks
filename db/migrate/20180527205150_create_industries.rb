class CreateIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :industries do |t|
      t.string :name
      t.references :sector, foreign_key: true

      t.timestamps
    end
  end
end
