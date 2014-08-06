class WordsController < ApplicationController
  def index
    @words = params[:query] ? get_unique_words( Word.get_words_from_inclusive_sort(params[:query]) ) :  @words = Word.first(50)
  end

  def get_unique_words(word_records)
    words = []
    word_records.each do |wr|
      words << wr.text
    end
    words.uniq
  end

  def search_params
    params.permit(:query)
    params.require(:word).permit(:sort_id, :length_id, :first_letter_id, :last_letter_id)
  end
end
