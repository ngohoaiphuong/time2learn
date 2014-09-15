class AddQuestionsToTests < ActiveRecord::Migration
  def change
    add_column :tests, :questions, :json, default: "{}"
  end
end
