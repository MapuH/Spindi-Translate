class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :spindi
      t.string :bg

      t.timestamps null: false
    end
  end
end