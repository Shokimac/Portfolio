class HomesController < ApplicationController

    def top
    end

    def about
    end

    def letter
        max_record = DroppedLetter.all.count
        while @letter.nil? == true do
        random_id = rand(1..max_record)
        @letter = DroppedLetter.find(random_id)
        end
    end
end