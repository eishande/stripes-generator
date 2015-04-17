class AddColumnsToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :colors, :string, array: true, default: []
    add_column :patterns, :user_id, :integer, null: false
    add_column :patterns, :dataset_id, :integer, null: false
  end
end
