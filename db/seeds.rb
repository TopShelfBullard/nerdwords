# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

letters = ('a'..'z').to_a
numbers = (1..100)

letters.each do |current_letter|
    FirstLetter.create(letter: current_letter)
    LastLetter.create(letter: current_letter)
end

numbers.each do |current_number|
    Length.create(number: current_number)
end

FirstLetter.find_each do |fl|
    print fl.letter
end

LastLetter.find_each do |ll|
    print ll.letter
end

Length.find_each do |n|
    print n.number
end

File.open("db/word_list.txt", "r") do |file|
    file.each_line do |line|
        if line.chomp[/[a-zA-Z]+/] == line.chomp
            current_word = line.chomp.downcase
            current_word_length = current_word.length

            included_letters = current_word.split('')
            word_first_letter_record = FirstLetter.find_by letter: included_letters.first
            word_last_letter_record = LastLetter.find_by letter: included_letters.last

            sorted_letters = included_letters.sort
            sorted_first_letter_record = FirstLetter.find_by letter: sorted_letters.first
            sorted_last_letter_record = LastLetter.find_by letter: sorted_letters.last

            joined_sort = sorted_letters.join

            if Sort.find_by(inclusion: joined_sort, first_letter_id: sorted_first_letter_record.id, last_letter_id: sorted_last_letter_record.id, length_id: current_word_length)
                current_sort = Sort.find_by(inclusion: joined_sort, first_letter_id: sorted_first_letter_record.id, last_letter_id: sorted_last_letter_record.id, length_id: current_word_length)
            else
                current_sort = Sort.create(inclusion: joined_sort, first_letter_id: sorted_first_letter_record.id, last_letter_id: sorted_last_letter_record.id, length_id: current_word_length)
            end

            new_word = Word.create(text: current_word, sort_id: current_sort.id, first_letter_id: word_first_letter_record.id, last_letter_id: word_last_letter_record.id, length_id: current_word_length)
            puts "Word -- id:#{new_word.id}  text:#{new_word.text}  sort_id:#{new_word.sort_id}  first_letter_id:#{new_word.first_letter_id}  last_letter_id:#{new_word.last_letter_id}  length_id:#{new_word.length_id}"
            puts "FirstLetter -- #{FirstLetter.find(new_word.first_letter_id)} -- LastLetter -- #{LastLetter.find(new_word.last_letter_id)} -- Length -- #{Length.find(new_word.length_id)}"
            puts "Sort -- id:#{current_sort.id}  inclusion:#{current_sort.inclusion}  first_letter_id:#{current_sort.first_letter_id}  last_letter_id:#{current_sort.last_letter_id}  length_id:#{current_sort.length_id}"
            puts "FirstLetter -- #{FirstLetter.find(current_sort.first_letter_id)} -- LastLetter -- #{LastLetter.find(current_sort.last_letter_id)} -- Length -- #{Length.find(current_sort.length_id)}"
        end
    end
end
