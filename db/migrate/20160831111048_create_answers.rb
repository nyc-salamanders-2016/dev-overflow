class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.boolean :best_answer, default: false
      t.references :user, :question

      t.timestamps(null: false)
    end
  end
end
