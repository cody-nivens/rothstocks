class HoldingsGrid < BaseGrid

  scope do
    Holding
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:holding)
  date_column(:created_at)
end
