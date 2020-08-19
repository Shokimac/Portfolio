class HomesController < ApplicationController
    def top

    end

    def about

    end

    def letter
        @letter = DroppedLetter.find(1)
    end
end
