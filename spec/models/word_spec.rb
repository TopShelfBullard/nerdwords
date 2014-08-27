require 'rails_helper'

RSpec.describe Word, :type => :model do

    it "gets words from inclusive sorts" do
      expected_word_records = []
      ['bat', 'tab', 'ab', 'sat', 'at', 'hi'].each do |word|
        sort = word.dup.split('').sort.join

        sort_record = Sort.find_by(sort:sort)
        sort_record = sort_record.nil? ? Sort.create(sort:sort) : sort_record

        expected_word_records << Word.create(word:word, sort_id:sort_record.id)
      end

      word_records = Word.get_words_from_inclusive_sort('bisath')
      expect(word_records.sort).to eq(expected_word_records.sort)
    end

end
