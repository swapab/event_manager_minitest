require './test/test_helper'

class EventManagerTest < MiniTest::Test

  def test_it_exists
    em = EventManager.new
    assert_kind_of EventManager, em
  end
end
