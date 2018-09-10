class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :images, :pictutre, :picture
  end
end
