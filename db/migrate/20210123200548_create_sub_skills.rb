class CreateSubSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_skills do |t|
      t.string :title
      t.references :skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
