require 'test_helper'

class AffiliateTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Affiliate.new.valid?
  end
end
