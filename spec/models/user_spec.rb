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
    let(:user) { create(:user) }
    
    context 'nameカラム' do
        it "空欄でないこと" do
        user.name = ''
        expect(user.valid?).to eq false;
        end

        it "20文字以内であること" do
        user.name = Faker::Lorem.characters(number:20)
        expect(user.valid?).to eq true;
        end

        it "21文字目で弾かれること" do
        user.name = Faker::Lorem.characters(number:21)
        expect(user.valid?).to eq false;
        end
    end

    context 'emailカラム' do
        it "空欄でないこと" do
        user.email = ''
        expect(user.valid?).to eq false;
        end

        it "50文字以内あること" do
        user.email = "#{Faker::Lorem.characters(number:39)}@sample.com"
        expect(user.valid?).to eq true;
        end

        it "51文字目で弾かれること" do
        user.email = "#{Faker::Lorem.characters(number:40)}@sample.com"
        expect(user.valid?).to eq false;
        end
    end

    context 'introductionカラム' do
        it "150文字以内であること" do
        user.introduction = Faker::Lorem.characters(number:150)
        expect(user.valid?).to eq true;
        end

        it "151文字目で弾かれること" do
        user.introduction = Faker::Lorem.characters(number:151)
        expect(user.valid?).to eq false;
        end
    end
end

end
