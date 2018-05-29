require 'test_helper'

class IndustryTest < ActiveSupport::TestCase
  def setup
    @industry = industries(:one)
  end

  test 'valid industry' do
    assert @industry.valid?
  end

  test 'invalid without industry' do
    @industry.name = nil
    refute @industry.valid?
    assert_not_nil @industry.errors[:industry]
  end

end
