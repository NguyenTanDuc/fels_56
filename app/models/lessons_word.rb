class LessonsWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson

  scope :word_correct, ->{where word_correct: true}

  private
  def self.to_csv
    CSV.generate do |csv|
      csv << [I18n.t(:correct), I18n.t(:word)]
      all.each do |item|
        csv << [item.word_correct, item.word.content]
      end
      csv << [I18n.t(:total), all.word_correct.count.to_s + I18n.t(:per_20)]
    end
  end
end
