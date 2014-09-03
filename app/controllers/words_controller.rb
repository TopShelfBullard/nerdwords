class WordsController < ApplicationController
  def index
    @words = params[:query] ? Word.get_words_from_inclusive_sort(params[:query], []).sort :  Word.first(50)
  end

  def show
  end

  def destroy
  end

  def search_params
    params.permit(:query)
    params.require(:word).permit(:sort_id, :length_id, :first_letter_id, :last_letter_id)
  end

end
