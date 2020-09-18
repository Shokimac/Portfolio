class HomesController < ApplicationController
    before_action :authenticate_user!, only: [:letter]

    def top
    end

    def about
    end

    def letter
        @letter = DroppedLetter.find_by(delete_flg: true)
        while @letter.delete_flg == true do
        @letter = DroppedLetter.where('id>=?', rand(DroppedLetter.first.id..DroppedLetter.last.id)).first
        end
    end
end