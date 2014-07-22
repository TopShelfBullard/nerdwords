class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :text
      t.integer :sort_id

      t.timestamps
    end
  end
end
