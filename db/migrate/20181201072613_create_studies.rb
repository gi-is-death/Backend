class CreateStudies < ActiveRecord::Migration[5.2]
  def change
    create_table :studies do |t|
      t.string :name
      t.string :description
      t.boolean :is_resgistration
      t.integer :year
      t.integer :semester
      t.integer :limit_num_of_mem
      t.integer :num_of_mem
      t.integer :leader_ID

      t.timestamps
    end
  end
end
