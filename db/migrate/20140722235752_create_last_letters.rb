class CreateLastLetters < ActiveRecord::Migration
  def change
    create_table :last_letters do |t|
      t.string :letter

      t.timestamps
    end
  end
end
