class RemoveExclusionFromSorts < ActiveRecord::Migration
  def change
    remove_column :sorts, :exclusion, :string
  end
end
