class CreateSorts < ActiveRecord::Migration
  def change
    create_table :sorts do |t|
      t.string :sort

      t.timestamps
    end
    add_index :sorts, :sort
  end
end
