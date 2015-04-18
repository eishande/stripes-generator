class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.integer :user_id, null:false
      t.string :name
      t.integer :data, array: true, default: []
    end
  end
end
