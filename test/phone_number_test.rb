require './test/test_helper'

describe PhoneNumber do
  describe 'clean phone number' do
    before do
      @clean_phone_number = '0223334444'
    end

    it 'with periods' do
      phone_number = PhoneNumber.new('022.333.4444')
      assert_equal @clean_phone_number, phone_number.phone_number
    end

    it 'with hyphens' do
      phone_number = PhoneNumber.new('022-333-4444')
      assert_equal @clean_phone_number, phone_number.phone_number
    end

    it 'with braces and spaces' do
      phone_number = PhoneNumber.new('(022) 333 4444')
      assert_equal @clean_phone_number, phone_number.phone_number
    end

    it 'test_it_removes_leading_one_from_an_eleven_digit_phone_number' do
      attendee = PhoneNumber.new("02024449382")
      assert_equal "2024449382", attendee.phone_number
    end
  end

  describe 'throws away phone numbers if' do
    it 'numbers_are_too_long' do
      phone_number = PhoneNumber.new("23334445555")
      assert_equal "0000000000", phone_number.phone_number
    end

    it 'numbers_are_too_short' do
      phone_number = PhoneNumber.new("222333444")
      assert_equal "0000000000", phone_number.phone_number
    end
  end
end
