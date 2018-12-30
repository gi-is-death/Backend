class CreateHaveWikis < ActiveRecord::Migration[5.2]
  def change
    create_table :have_wikis do |t|
      t.integer :wiki_id
      t.integer :study_id

      t.timestamps
    end
  end
end
