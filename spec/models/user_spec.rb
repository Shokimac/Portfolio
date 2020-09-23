require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'アソシエーションのテスト' do
    context 'Episodeモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:episodes).macro).to eq :has_many  
      end
    end
    
    context 'EpisodeFavoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:episode_favorites).macro).to eq :has_many 
      end
    end

    context 'EpisodeBookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:episode_bookmarks).macro).to eq :has_many 
      end
    end

    context 'Proverbモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:proverbs).macro).to eq :has_many 
      end
    end

    context 'ProverbFavoriteモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:proverb_favorites).macro).to eq :has_many 
      end
    end

    context 'ProverbBookmarkモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:proverb_bookmarks).macro).to eq :has_many 
      end
    end

    context 'PostCommentモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:post_comments).macro).to eq :has_many 
      end
    end    
  end

  describe "バリデーションのテスト" do
    before do
      @user = FactoryBot.create(:user)
    end

    context 'nameカラム' do
      it "空欄でないこと" do
      @user.name = ''
      expect(@user.valid?).to eq false;
    end
    
  end
  
end

end
