class CreateFirstLetters < ActiveRecord::Migration
  def change
    create_table :first_letters do |t|
      t.string :letter

      t.timestamps
    end
  end
end
