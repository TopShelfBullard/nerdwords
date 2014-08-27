class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.integer :sort_id

      t.timestamps
    end
    add_index :words, :word
    add_index :words, :sort_id
  end
end
