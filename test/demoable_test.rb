require 'test_helper'

class DemoableTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Demoable
  end
end
