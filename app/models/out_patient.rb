class OutPatient < ApplicationRecord
  self.primary_key = :novem_digit
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
end
