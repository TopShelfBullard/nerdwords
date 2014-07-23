class Sort < ActiveRecord::Base
    has_many :words
    belongs_to :first_letter
    belongs_to :last_letter
    belongs_to :length
end
