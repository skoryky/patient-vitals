class Patient < ActiveRecord::Base

  MAX_BED_LENGTH = 50
  MAX_FIRST_NAME_LENGTH = 50
  MAX_LAST_NAME_LENGTH = 50
  MAX_MRN_LENGTH = 50

  has_many :vitals_readings

  validates :bed, length: {maximum: MAX_BED_LENGTH}, presence: true
  validates :first_name, length: {maximum: MAX_FIRST_NAME_LENGTH}, presence: true
  validates :last_name, length: {maximum: MAX_LAST_NAME_LENGTH}, presence: true
  validates :mrn, length: {maximum: MAX_MRN_LENGTH}, presence: true, uniqueness: true

  def name
    "#{last_name}, #{first_name}"
  end

end
