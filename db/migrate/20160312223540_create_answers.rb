class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :question_id
      t.boolean :is_complete

      t.timestamps null: false
    end
  end
end
