class Sort < ActiveRecord::Base
  has_many :words
  belongs_to :first_letter
  belongs_to :last_letter
  belongs_to :length
  
  def self.get_inclusive_sort_records(inclusion)
    letters = inclusion.split('')
    sort = letters.sort.join
    sorts = self.get_inclusive_sorts(sort)
    sort_records = []
    
    sorts.each do |s|
      length = Length.find_by(number: s.length)
      first_letter = FirstLetter.find_by(letter: s[0])
      last_letter = LastLetter.find_by(letter: s[s.length - 1])

      if length and first_letter and last_letter and Sort.where(length_id: length.id, first_letter_id: first_letter.id, last_letter_id: last_letter.id, inclusion: s)
        sort_record = Sort.where(length_id: length.id, first_letter_id: first_letter.id, last_letter_id: last_letter.id, inclusion: s)
        sort_records << sort_record
      end
    end

    if sort_records
      sort_records.each do |s|
        puts s.inclusion
      end
    end

    sort_records
  end

  def self.get_inclusive_sorts(inclusion)
    sorted_letters = inclusion.split('')
    sorts = []
    self.build_inclusive_sort_group(sorts, sorted_letters)
  end

  def self.build_inclusive_sort_group(sorts, letters)
    return sorts if letters.length == 0
  
    new_sorts = self.build_sorts_from_letters(sorts, letters)
    letters.delete_at(0)
    
    self.build_inclusive_sort_group(new_sorts, letters)
  end

  def self.build_sorts_from_letters(sorts, letters)
    return sorts if letters.length == 0
  
    sorts << letters.join
    letters.pop

    self.build_sorts_from_letters(sorts, letters)
  end

end
