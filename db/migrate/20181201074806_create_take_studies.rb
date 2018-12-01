class CreateTakeStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :take_studies do |t|
      t.integer :mem_ID
      t.integer :study_ID

      t.timestamps
    end
  end
end
