class FirstLetter < ActiveRecord::Base
    has_many :words
    has_many :sorts
end
