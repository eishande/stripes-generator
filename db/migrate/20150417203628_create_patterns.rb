class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :colors, array: true, default: []
      t.integer :user_id, null: false
      t.integer :dataset_id, null: false
    end
  end
end
