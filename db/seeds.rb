# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

File.open("db/word_list.txt", "r") do |file|
  file.each_line do |line|                                          
    if line.chomp[/[a-zA-Z]+/] == line.chomp
      current_word = line.chomp.downcase

      sort_record = Sort.find_by(sort: current_word.split('').sort.join)
      sort_record = sort_record.nil? ? Sort.create(sort: current_word.split('').sort.join) : sort_record

      new_word = Word.create(word: current_word, sort_id: sort_record.id)
    
      word_id = new_word.id
      word = new_word.word

      sort_id = sort_record.id
      sort = sort_record.sort

      puts "#{word_id}:  #{word}   --   #{sort_id}:  #{sort}"
    end  
  end
end