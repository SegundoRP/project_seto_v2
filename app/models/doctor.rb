class Doctor < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :profession, presence: true
end
