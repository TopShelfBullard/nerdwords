class Sort < ActiveRecord::Base
  has_many :words
  has_many :deleted_words
  
  class << self

    def get_inclusive_sorts(user_input)
      user_input = self.validate_user_input(user_input.chomp.downcase)     

      current_strings = user_input[:valid_user_input].sort
      letters = current_strings.dup
      records = current_strings.map{|sort| self.find_by(sort:sort)} - [nil]
      
      1.upto(letters.length) do
        current_strings = add_each_letter_to_each_string(current_strings,  letters)        
        records << current_strings.map{|sort| self.find_by(sort:sort)} - [nil]
      end

      records.flatten
    end

    def validate_user_input(user_input, valid_user_input_characters = [], invalid_user_input_characters = [])
      user_input_characters = user_input.chomp.downcase.split('')
      { valid_user_input:user_input_characters.select{|character| character[/[a-z]+/]}, 
        invalid_user_input:user_input_characters - user_input_characters.select{|character| character[/[a-z]+/]} }
    end

    def add_each_letter_to_each_string(strings, letters,  new_strings = [])
      new_strings = strings.map{|string| self.adjust_letters(letters.dup, string.dup.split('')).map{|letter| "#{string}#{letter}"}}
      new_strings.flatten!.uniq
    end

    def adjust_letters(letters, string_letters)
      while string_letters.length > 0
        string_letters.shift if string_letters[0] == letters.shift
      end
      letters
    end

  end
end
