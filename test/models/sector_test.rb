require 'test_helper'

class SectorTest < ActiveSupport::TestCase
  def setup
    @sector = sectors(:one)
  end

  test 'valid sector' do
    assert @sector.valid?
  end

  test 'invalid without sector' do
    @sector.name = nil
    refute @sector.valid?
    assert_not_nil @sector.errors[:sector]
  end

end
