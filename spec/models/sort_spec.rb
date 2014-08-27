require "rails_helper"

RSpec.describe Sort, :type => :model do

  it "adds each letter to a string" do
    actual_strings = Sort.add_each_letter_to_string({string:'ab', letters:['c','d','e']})
    expected_strings = ['abc', 'abd', 'abe']

    expect(actual_strings).to eq(expected_strings)
  end

  it "adds each letter to a string even on the first go-round" do
    actual_strings = Sort.add_each_letter_to_string({string:'a', letters:['b', 'c', 'd', 'e']})
    expected_strings = [ 'ab', 'ac', 'ad', 'ae' ]

    expect(actual_strings).to eq(expected_strings)
  end

  it "adds each letter to each string" do
    strings = ['ab', 'ac', 'ad', 'ae', 'bc', 'bd', 'be', 'cd', 'ce', 'de']
    letters = ['a', 'b', 'c', 'd', 'e']
    actual_strings = Sort.add_each_letter_to_each_string({strings:strings, letters:letters})
    expected_strings = ['abc', 'abd', 'abe', 'acd', 'ace', 'ade', 'bcd', 'bce', 'bde', 'cde']

    expect(actual_strings).to eq(expected_strings)
  end

  it "adds each letter to each string even with longer strings" do
    strings = ['abc', 'abd', 'abe', 'bcd', 'bce', 'cde']
    letters = ['a', 'b', 'c', 'd', 'e']
    actual_strings = Sort.add_each_letter_to_each_string({strings:strings, letters:letters})
    expected_strings = ['abcd', 'abce', 'abde', 'bcde']

    expect(actual_strings).to eq(expected_strings)
  end

  it "adds each letter to each string even on the first go-round" do
    actual_strings = Sort.add_each_letter_to_each_string({strings:['a', 'b', 'c', 'd', 'e'], letters:['a', 'b', 'c', 'd', 'e']})
    expected_strings = ['ab', 'ac', 'ad', 'ae', 'bc', 'bd', 'be', 'cd', 'ce', 'de']

    expect(actual_strings).to eq(expected_strings)
  end

  it "creates the initial hash" do
    user_input = "abcde"
    hash = Sort.create_initial_hash(user_input)
    expected_hash = {current_strings:['a', 'b', 'c', 'd', 'e'], letters:['a', 'b', 'c', 'd', 'e']}
    expect(hash).to eq(expected_hash)
  end

  it "validation returns a down-cased copy of the user input if the user input is a string of letters only" do
    validated_user_input = Sort.validate_user_input('abcdEFGhiJkL')
    expected_validated_user_input = 'abcdefghijkl'

    expect(validated_user_input).to eq(expected_validated_user_input)
  end

  it "validation returns nil if user input contains special characters" do
    validated_user_input = Sort.validate_user_input('abcdEF$GhiJkL')
    expected_validated_user_input = nil

    expect(validated_user_input).to eq(expected_validated_user_input)
  end

  it "validation returns nil if user input contains special characters" do
    validated_user_input = Sort.validate_user_input('abcd1kdospodi')
    expected_validated_user_input = nil

    expect(validated_user_input).to eq(expected_validated_user_input)
  end

  it "gets inclusive sorts as an array of all possible sorts" do
    the = Sort.create(sort: "eht")
    dude = Sort.create(sort: "ddeu")
    abides = Sort.create(sort: "abdeis")

    sorts = Sort.get_inclusive_sorts('TheDudeAbides')
    expected_sorts = [the, dude, abides]

    expect(sorts).to eq(expected_sorts)
  end

  it "get inclusive sorts as nil when user input is not valid" do
    sorts = Sort.get_inclusive_sorts('ab1cd')

    expect(sorts).to eq(nil)
  end

  it "can adjust the letters used for iterating" do
    new_letters = Sort.adjust_letters(['a', 'b', 'c', 'd', 'e'], 'bc')
    expected_letters = ['d', 'e']

    expect(new_letters).to eq(expected_letters)
  end

  it "gets records from sort array" do
    the = Sort.create(sort: "eht")
    dude = Sort.create(sort: "ddeu")
    abides = Sort.create(sort: "abdeis")

    sorts = Sort.get_records_from_sort_array(["eht", "abt", "ddeu", "abdeis"])
    expected_sorts = [the, dude, abides]

    expect(sorts).to eq(expected_sorts)
  end

end
