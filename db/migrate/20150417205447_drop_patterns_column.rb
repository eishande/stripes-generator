class DropPatternsColumn < ActiveRecord::Migration
  def change
    change_table :patterns do |t|
      t.remove :patterns
    end
  end
end
