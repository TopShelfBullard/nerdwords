class Word < ActiveRecord::Base
    belongs_to :sort
    belongs_to :first_letter
    belongs_to :last_letter
    belongs_to :length
end
