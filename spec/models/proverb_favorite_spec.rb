require 'rails_helper'

RSpec.describe 'ProverbFavoriteモデルのテスト', type: :model do
    describe 'アソシエーションのテスト' do
        context 'Userモデルとの関係' do
            it 'N:1となっている' do
                expect(ProverbFavorite.reflect_on_association(:user).macro).to eq :belongs_to  
            end
        end

        context 'Proverbモデルとの関係' do
            it 'N:1となっている' do
                expect(ProverbFavorite.reflect_on_association(:proverb).macro).to eq :belongs_to  
            end
        end

    end
end
