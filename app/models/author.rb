class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validate :ten_digit_phone_num

  def ten_digit_phone_num
  	if phone_number.length != 10
  	  errors.add(:phone_number, "phone number is not ten digits")
  	end
  end
end
