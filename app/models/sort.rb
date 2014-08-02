class Sort < ActiveRecord::Base
  has_many :words
  belongs_to :first_letter
  belongs_to :last_letter
  belongs_to :length
  
  def self.get_inclusive_sort_records(inclusion)
    sort_records = []
    sorts = self.build_inclusive_sorts(inclusion.split('').sort)
    
    sorts.each do |s|
      sort_record = self.get_sort_record(s)
      sort_records << sort_record unless sort_record.nil?
    end
    
    sort_records
  end

  def self.get_sort_record(sort)
      length = Length.find_by(number: sort.length).id
      first_letter = FirstLetter.find_by(letter: sort[0]).id
      last_letter = LastLetter.find_by(letter: sort[sort.length - 1]).id

      sort_record = Sort.find_by(length_id: length, first_letter_id: first_letter , last_letter_id: last_letter, inclusion: sort)
  end

  def self.build_inclusive_sorts(letters)
    sorts = []

    while letters.length > 0
      inner_letters = letters.dup
      
      while inner_letters.length > 0
        sorts << inner_letters.join
        inner_letters.pop
      end

      letters.delete_at(0)
      letters
    end

    sorts
  end

end
