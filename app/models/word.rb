class Word < ActiveRecord::Base
  belongs_to :sort
  class << self

    def get_words_from_inclusive_sort(scrambled_word_query, word_records)
      Sort.get_inclusive_sorts(scrambled_word_query).map{|sort_record| sort_record.words}.flatten
    end

  end
end
