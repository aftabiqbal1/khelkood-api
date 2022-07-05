class Booking < ApplicationRecord
  #Relationships
  belongs_to :user
  belongs_to :sports_complex
  has_one :transaction_detail
end
