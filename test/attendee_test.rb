require 'minitest/autorun'
require './lib/attendee'

class AttendeeTest < MiniTest::Test

  def test_it_exists
    attendee = Attendee.new
    assert_kind_of Attendee, attendee
  end

  def test_it_is_initialized_from_a_hash_of_data
    data = {:first_name => 'Donald', :last_name => 'Trump', :phone_number => '1234567890'}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    assert_equal data[:last_name], attendee.last_name
    assert_equal data[:phone_number], attendee.phone_number
  end

  def test_it_can_change_first_names
    data = {:first_name => 'Donald'}
    attendee = Attendee.new(data)
    assert_equal data[:first_name], attendee.first_name
    attendee.first_name = "Evanka"
    assert_equal "Evanka", attendee.first_name
  end


  def test_it_can_change_last_names
    data = {:last_name => 'Trump'}
    attendee = Attendee.new(data)
    assert_equal data[:last_name], attendee.last_name
    attendee.last_name = 'Clinton'
    assert_equal 'Clinton', attendee.last_name
  end

  def test_it_can_change_phone_numbers
    data = {:phone_number => '1234567890'}
    attendee = Attendee.new(data)
    assert_equal data[:phone_number], attendee.phone_number
    attendee.phone_number = '0987654321'
    assert_equal '0987654321', attendee.phone_number
  end

  def test_it_cleans_up_phone_numbers_with_spaces_and_parentheses
    attendee = Attendee.new(:phone_number => '(022) 333 4444')
    assert_equal '0223334444', attendee.phone_number
  end

  def test_it_removes_leading_zero_from_an_eleven_digit_phone_number
    attendee = Attendee.new(:phone_number => "01234567890")
    assert_equal "1234567890", attendee.phone_number
  end

  def test_it_throws_away_phone_numbers_that_are_too_long
    attendee = Attendee.new(:phone_number => "001234567890")
    assert_equal "0000000000", attendee.phone_number
  end

  def test_it_throws_away_phone_numbers_that_are_too_short
    attendee = Attendee.new(:phone_number => "123456789")
    assert_equal "0000000000", attendee.phone_number
  end
end
