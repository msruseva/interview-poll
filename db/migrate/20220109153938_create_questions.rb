class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.integer :poll_id
      t.string :title
      t.timestamps
    end
  end
end
