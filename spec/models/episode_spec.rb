require 'rails_helper'

RSpec.describe 'Episodeモデルのテスト', type: :model do
    describe 'アソシエーションのテスト' do
        context 'Userモデルとの関係' do
            it 'N:1となっている' do
                expect(Episode.reflect_on_association(:user).macro).to eq :belongs_to  
            end
        end

        context 'EpisodeFavoriteモデルとの関係' do
            it '1:Nとなっている' do
                expect(Episode.reflect_on_association(:episode_favorites).macro).to eq :has_many  
            end
        end

        context 'EpisodeBookmarkモデルとの関係' do
            it '1:Nとなっている' do
                expect(Episode.reflect_on_association(:episode_bookmarks).macro).to eq :has_many  
            end
        end
    end

    describe "バリデーションのテスト" do
        let(:episode) { create(:episode) }
        
        context 'titleカラム' do
            it "空欄でないこと" do
            episode.title = ''
            expect(episode.valid?).to eq false;
            end

            it "80文字以内であること" do
            episode.title = Faker::Lorem.characters(number:80)
            expect(episode.valid?).to eq true;
            end

            it "81文字目で弾かれること" do
            episode.title = Faker::Lorem.characters(number:81)
            expect(episode.valid?).to eq false;
            end
        end
    
        context 'bodyカラム' do
            it "空欄でないこと" do
            episode.body = ''
            expect(episode.valid?).to eq false;
            end

            it "500文字以内あること" do
            episode.body = Faker::Lorem.characters(number:500)
            expect(episode.valid?).to eq true;
            end

            it "501文字目で弾かれること" do
            episode.body = Faker::Lorem.characters(number:501)
            expect(episode.valid?).to eq false;
            end
        end
    end
end