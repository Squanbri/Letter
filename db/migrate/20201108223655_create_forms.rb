class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.string :fio
      t.string :phone
      t.string :company
      t.text :comment
      t.text :skills

      t.timestamps
    end
  end
end
