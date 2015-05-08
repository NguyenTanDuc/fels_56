class CreateLessonsWords < ActiveRecord::Migration
  def change
    create_table :lessons_words do |t|
      t.references :word, index: true, foreign_key: true
      t.references :lesson, index: true, foreign_key: true
      t.boolean :word_correct

      t.timestamps null: false
    end
    add_index :lessons_words, [:lesson_id, :word_id], unique: true
  end
end
