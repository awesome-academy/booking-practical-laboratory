class Form < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :time_sheets

  enum status: {active: 0, actived: 1}
  enum name_room: {PM1: 1, PM2: 2, PM3: 3, PM4: 4}
end
