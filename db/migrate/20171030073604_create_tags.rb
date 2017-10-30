class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :content
      t.integer :page_id

      t.timestamps
    end
  end
end
