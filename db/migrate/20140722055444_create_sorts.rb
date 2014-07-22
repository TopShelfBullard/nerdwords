class CreateSorts < ActiveRecord::Migration
  def change
    create_table :sorts do |t|
      t.string :inclusion
      t.string :exclusion

      t.timestamps
    end
  end
end
