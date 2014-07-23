class CreateLengths < ActiveRecord::Migration
  def change
    create_table :lengths do |t|
      t.integer :number

      t.timestamps
    end
  end
end
