require 'rails_helper'

RSpec.describe 'EpisodeBookmarkモデルのテスト', type: :model do
    describe 'アソシエーションのテスト' do
        context 'Userモデルとの関係' do
            it 'N:1となっている' do
                expect(EpisodeBookmark.reflect_on_association(:user).macro).to eq :belongs_to  
            end
        end

        context 'Episodeモデルとの関係' do
            it 'N:1となっている' do
                expect(EpisodeBookmark.reflect_on_association(:episode).macro).to eq :belongs_to  
            end
        end

    end
end
