class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
