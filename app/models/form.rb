class Form < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :time_sheets

  enum status: {active: 0, actived: 1}
end
