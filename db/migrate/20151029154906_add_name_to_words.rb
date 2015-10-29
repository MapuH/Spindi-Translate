class AddNameToWords < ActiveRecord::Migration
  def change
    add_column :words, :name, :boolean, :default => false
  end
end
