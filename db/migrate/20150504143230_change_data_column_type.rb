class ChangeDataColumnType < ActiveRecord::Migration
  def change
    change_column :datasets, :data, :text
    change_column_null :datasets, :data, false
    change_column_default :datasets, :data, nil
  end
end
