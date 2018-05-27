class IndustriesGrid < BaseGrid

  scope do
    Industry
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:name)
  date_column(:created_at)
end
