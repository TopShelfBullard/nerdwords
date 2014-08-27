class Sort < ActiveRecord::Base
  has_many :words
  has_many :deleted_words
  
  class << self

    def get_inclusive_sorts(user_input)
        valid_user_input = self.validate_user_input(user_input)     
        return nil if valid_user_input == nil

        data_hash = self.create_initial_hash(valid_user_input)

        records = []
          1.upto(data_hash[:letters].length) do
          parameters = {strings:data_hash[:current_strings], letters:data_hash[:letters]}
          data_hash[:current_strings] = add_each_letter_to_each_string(parameters)

          records = records + self.get_records_from_sort_array(data_hash[:current_strings])

        end

        records
    end

    def create_initial_hash(valid_user_input)
      current_strings = valid_user_input.split('').sort
      letters = current_strings.dup
      {current_strings:current_strings, letters:letters}
    end

    def validate_user_input(user_input)
      user_input = user_input.chomp.downcase
      is_user_input_valid = user_input[/[a-z]+/] == user_input
      
      validated_input =  is_user_input_valid ? user_input : nil
    end

    def add_each_letter_to_each_string(hash)
      new_strings = []

      hash[:strings].each do |string|
        new_letters = self.adjust_letters(hash[:letters], string)
        new_strings =  new_strings + self.add_each_letter_to_string({string:string, letters:new_letters})
      end
      new_strings.uniq!
      new_strings
    end

    def adjust_letters(letters, string)
      new_letters = letters.dup
      string_letters = string.dup.split('')
      while string_letters.length > 0
        if(string_letters[0] == new_letters[0])
          string_letters.shift
        end
        new_letters.shift
      end
      new_letters
    end

    def add_each_letter_to_string(hash)
      strings = []

      hash[:letters].each do |letter|
        strings  << "#{hash[:string]}#{letter}"
      end

      strings
    end

    def get_records_from_sort_array(sorts)
      sort_records = []
      sorts.each do |sort|
        sort_records << self.find_by(sort:sort) unless self.find_by(sort:sort) == nil
      end
      sort_records
    end

  end
end
