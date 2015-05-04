require 'test_helper'

class CeTest < ActiveSupport::TestCase

  def setup
    @ce = ces(:one)
  end

  test "topic should be present " do
    @ce.topic = ""
    assert @ce.invalid?
  end

  test "date should be present " do
    @ce.date = ""
    assert @ce.invalid?
  end

  test "hours should be present " do
    @ce.hours = ""
    assert @ce.invalid?
  end

  test "classtype should be present " do
    @ce.classtype = ""
    assert @ce.invalid?
  end
end
