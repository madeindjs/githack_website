class Leak < ApplicationRecord
  belongs_to :repository
  enum status: %i[unchecked unsafe safe]
end
