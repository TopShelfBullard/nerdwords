class AddFirstLetterIdAndLastLetterIdAndLengthIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :first_letter_id, :integer
    add_column :words, :last_letter_id, :integer
    add_column :words, :length_id, :integer
  end
end
