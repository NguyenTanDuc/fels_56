class LessonsWord < ActiveRecord::Base
  belongs_to :word
  belongs_to :lesson
end
