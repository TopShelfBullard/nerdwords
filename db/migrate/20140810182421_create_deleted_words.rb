class CreateDeletedWords < ActiveRecord::Migration
  def change
    create_table :deleted_words do |t|
      t.string :deleted_word
      t.text :reason
      t.integer :sort_id

      t.timestamps
    end
    add_index :deleted_words, :deleted_word
    add_index :deleted_words, :reason
    add_index :deleted_words, :sort_id
  end
end
