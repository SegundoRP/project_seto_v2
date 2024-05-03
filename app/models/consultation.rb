class Consultation < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :type_of_service

  #  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**3) },
  #                    format: { with: /\A\d{1,3}(\.\d{1,2})?\z/ }
end
