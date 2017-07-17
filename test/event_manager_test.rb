require 'minitest/autorun'
require './event_manager'

class EventManagerTest < MiniTest::Test

  def test_it_exists
    em = EventManager.new
    assert_kind_of EventManager, em
  end
end
