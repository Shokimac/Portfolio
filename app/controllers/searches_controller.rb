class SearchesController < ApplicationController

  before_action :authenticate_user!

  def search
    @range = params[:range]
    @word = params[:word]

    if @range == '1'
      @episodes = Episode.search(@word)
    else
      @proverbs = Proverb.search(@word)
    end
  end
end
