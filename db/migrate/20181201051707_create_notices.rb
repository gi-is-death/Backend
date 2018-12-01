class CreateNotices < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.date :date
      t.integer :author_ID
      t.string :title
      t.string :content
      t.integer :seen

      t.timestamps
    end
  end
end
