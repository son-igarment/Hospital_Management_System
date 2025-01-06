class InPatient < ApplicationRecord
  self.primary_key = :novem_digit
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :date_of_admission, presence: true
  validates :sickroom, presence: true
  validates :fee, presence: true
  validates :nurse_id, presence: true
end



# imma need doctor_id, full_name, 

