class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :patterns, :colors, array: true, default: []
      t.integer :patterns, :user_id, null: false
      t.integer :patterns, :dataset_id, null: false
    end
  end
end
