require "rails_helper"

RSpec.describe Sort, :type => :model do

  it "adds each letter to each string" do
    strings = ['ab', 'ac', 'ad', 'ae', 'bc', 'bd', 'be', 'cd', 'ce', 'de']
    letters = ['a', 'b', 'c', 'd', 'e']
    actual_strings = Sort.add_each_letter_to_each_string(strings, letters)
    expected_strings = ['abc', 'abd', 'abe', 'acd', 'ace', 'ade', 'bcd', 'bce', 'bde', 'cde']

    expect(actual_strings).to eq(expected_strings)
  end

  it "adds each letter to each string even with longer strings" do
    strings = ['abc', 'abd', 'abe', 'bcd', 'bce', 'cde']
    letters = ['a', 'b', 'c', 'd', 'e']
    actual_strings = Sort.add_each_letter_to_each_string(strings, letters)
    expected_strings = ['abcd', 'abce', 'abde', 'bcde']

    expect(actual_strings).to eq(expected_strings)
  end

  it "adds each letter to each string even on the first go-round" do
    actual_strings = Sort.add_each_letter_to_each_string(['a', 'b', 'c', 'd', 'e'], ['a', 'b', 'c', 'd', 'e'])
    expected_strings = ['ab', 'ac', 'ad', 'ae', 'bc', 'bd', 'be', 'cd', 'ce', 'de']

    expect(actual_strings).to eq(expected_strings)
  end

  it "validation returns a hash" do
    validated_user_input = Sort.validate_user_input('abcd1%$spodi')
    expected_validated_user_input = {valid_user_input:['a', 'b', 'c', 'd', 's', 'p', 'o', 'd', 'i'], invalid_user_input:['1', '%', '$']}

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

  it "get inclusive sorts works the same with semi-valid user input" do
    the = Sort.create(sort: "eht")
    dude = Sort.create(sort: "ddeu")
    abides = Sort.create(sort: "abdeis")

    sorts_from_bad_input = Sort.get_inclusive_sorts('!@#$T%^&*h()_+e=-{}D[]\\|u;:\'\"d<>,.e?/~`A1234b5678i90des')
    sorts_from_good_input = Sort.get_inclusive_sorts('TheDudeAbides')

    expect(sorts_from_bad_input).to eq(sorts_from_good_input)
  end

  it "can adjust the letters used for iterating" do
    new_letters = Sort.adjust_letters(['a', 'b', 'c', 'd', 'e'], ['b', 'c'])
    expected_letters = ['d', 'e']

    expect(new_letters).to eq(expected_letters)
  end

end
