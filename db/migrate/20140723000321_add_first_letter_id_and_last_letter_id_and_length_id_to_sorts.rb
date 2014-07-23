class AddFirstLetterIdAndLastLetterIdAndLengthIdToSorts < ActiveRecord::Migration
  def change
    add_column :sorts, :first_letter_id, :integer
    add_column :sorts, :last_letter_id, :integer
    add_column :sorts, :length_id, :integer
  end
end
