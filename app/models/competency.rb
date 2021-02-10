class Competency < ApplicationRecord
  has_many :skills, dependent: :destroy
  belongs_to :category
end
