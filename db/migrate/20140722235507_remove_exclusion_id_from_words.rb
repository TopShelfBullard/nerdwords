class RemoveExclusionIdFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :exclusion_id, :integer
  end
end
