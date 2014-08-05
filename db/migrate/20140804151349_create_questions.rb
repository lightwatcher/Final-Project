class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :griffendor_answer
      t.string :huffelpuff_answer
      t.string :ravenclaw_answer
      t.string :slytheryn_answer
      t.integer :user_id

      t.timestamps
    end
  end
end
