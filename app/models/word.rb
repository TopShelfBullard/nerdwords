class Word < ActiveRecord::Base
  belongs_to :sort
  belongs_to :first_letter
  belongs_to :last_letter
  belongs_to :length

  def self.get_words_from_inclusive_sort(sort)
    sort_records = Sort.get_inclusive_sort_records(sort)
    words = []
    
    sort_records.each do |s|
      word_records = self.get_words_from_sort_record(s)
      word_records.each do |w|
        words << w
      end
    end
    words
  end
 
  def self.get_words_from_sort_record(sort_record)
    words = []

    Sort.find(sort_record).words.each do |word_record|
      words << Word.find(word_record)
    end

    words
  end

end
