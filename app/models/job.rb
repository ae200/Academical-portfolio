class Job < ApplicationRecord
  validates_presence_of :title
  has_many :portfolios
end
