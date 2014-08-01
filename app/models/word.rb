class Word < ActiveRecord::Base
  belongs_to :sort
  belongs_to :first_letter
  belongs_to :last_letter
  belongs_to :length

  def self.get_words_from_inclusive_sort(sort)
    sort_records = Sort.get_inclusive_sort_records(sort)
    words = []
    word_records = []
    
    sort_records.each do |s|
      word_records << self.where(sort_id: s)
    end
    
    word_records.each do |w|
      if not(w.empty?)
        words << w.text
      end
    end 

    words.each do |w|
      puts w
    end

    words
  end
      
end
