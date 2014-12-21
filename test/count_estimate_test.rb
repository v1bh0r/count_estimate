require 'test_helper'

class CountEstimateTest < ActiveSupport::TestCase
  test "count_estimate is defined" do
    assert Todo.all.respond_to? :count_estimate
  end
end
