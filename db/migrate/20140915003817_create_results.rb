class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :user
      t.references :test
      t.string :answer

      t.timestamps
    end
    add_index :results, :user_id
    add_index :results, :test_id
  end
end
