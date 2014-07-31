class Word < ActiveRecord::Base
  belongs_to :sort
  belongs_to :first_letter
  belongs_to :last_letter
  belongs_to :length

  def self.get_words_from_inclusive_sort(sort)
    sort_records = Sort.get_inclusive_sort_records(sort)
    words = []

    sort_records.each do |s|
      word_records = []
      if s.id and self.where(sort_id: s.id)
        word_records = self.where(sort_id: s.id)
        word_records.each do |w|
          words << w.text
        end  
      end
    end
    
    if words
      words.each do |w|
        puts w
      end
    end

    words
  end
      
end
