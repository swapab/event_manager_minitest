class PhoneNumber
  attr_accessor :phone_number

  def initialize(number)
    @phone_number = clean_phone_number(number)
  end

  private

  def clean_phone_number(number)
    if number
      number = number.scan(/[0-9]/).join
      if number.length == 11 && number.start_with?("0")
        number = number[1..-1]
      end

      if number.length != 10
        number = "0000000000"
      end

      return number
    end
  end
end
