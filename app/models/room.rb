class Room < ApplicationRecord
  has_many :forms
  has_many :time_sheets
end
