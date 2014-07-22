# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

letters = ('a'..'z').to_a

File.open("db/word_list.txt", "r") do |file|
    file.each_line do |line|
        if /[a-zA-Z]/.match(line.chomp)
            current_word = line.chomp.downcase

            include_letters = current_word.split('')
            exclude_letters = letters - include_letters

            sort_include = include_letters.sort.join
            sort_exclude = exclude_letters.sort.join

            if Sort.find_by inclusion: sort_include
                current_sort = Sort.find_by inclusion: sort_include
            else
                current_sort = Sort.create(inclusion: sort_include, exclusion: sort_exclude) unless Sort.find_by inclusion: sort_include
            end

            new_word = Word.create(text: current_word, sort_id: current_sort.id)
        end
    end
end
