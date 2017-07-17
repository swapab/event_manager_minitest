require './test/test_helper'

describe 'AttendeeTest' do

  def test_it_exists
    attendee = Attendee.new
    assert_kind_of Attendee, attendee
  end

  describe 'get data' do

    before do
      @data = {
        first_name: 'Donald',
        last_name:  'Trump',
        phone_number: '1234567890'

      }

      @attendee = Attendee.new(@data)
    end

    it 'test_returns_first_name' do
      assert_equal @data[:first_name], @attendee.first_name
    end

    it 'test_returns_last_name' do
      assert_equal @data[:last_name], @attendee.last_name
    end

    it 'test_returns_phone_number' do
      assert_equal @data[:phone_number], @attendee.phone_number
    end
  end

  it 'should update phone number' do
    attendee = Attendee.new(phone_number: '1234567890')
    assert_equal '1234567890', attendee.phone_number

    attendee.phone_number = '0987654321'
    refute_equal '1234567890', attendee.phone_number
    assert_equal '0987654321', attendee.phone_number
  end
end
