class User < ApplicationRecord
  TYPE = %w(Admin Teacher).freeze
  has_many :forms, dependent: :destroy
  has_many :using_rooms, through: :form
end
