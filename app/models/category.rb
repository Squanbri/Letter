class Category < ApplicationRecord
  has_many :competencies, dependent: :destroy
end
