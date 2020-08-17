class SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == '1'
      @users = Episode.search(@word)
    else
      @products = Proverb.search(@word)
    end
  end
end
