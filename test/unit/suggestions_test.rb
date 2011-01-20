require 'test_helper'

class SuggestionsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Suggestions.new.valid?
  end
end
