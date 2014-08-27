class Word < ActiveRecord::Base
  belongs_to :sort
  class << self

    def get_words_from_inclusive_sort(scrambled_word_query)
      sort_records = Sort.get_inclusive_sorts(scrambled_word_query)
      word_records = []
      
      sort_records.each do |s|
        records = s.words
        word_records = word_records + records
      end
      
      word_records
    end

  end
end
