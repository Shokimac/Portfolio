class HomesController < ApplicationController
    def top

    end

    def about

    end

    def letter
        @letter = DroppedLetter.find(2)
    end
end
