class Skill < ApplicationRecord
  has_many :sub_skills, dependent: :delete_all
  belongs_to :competency
end
