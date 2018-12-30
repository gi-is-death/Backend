class CreateWikiCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :wiki_categories do |t|
      t.integer :category_id
      t.integer :wiki_id

      t.timestamps
    end
  end
end
