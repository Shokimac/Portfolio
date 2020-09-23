require 'rails_helper'

RSpec.describe 'Proverbモデルのテスト', type: :model do
    describe 'アソシエーションのテスト' do
        context 'Userモデルとの関係' do
            it 'N:1となっている' do
                expect(Proverb.reflect_on_association(:user).macro).to eq :belongs_to  
            end
        end

        context 'PostCommentモデルとの関係' do
            it '1:Nとなっている' do
                expect(Proverb.reflect_on_association(:post_comments).macro).to eq :has_many  
            end
        end

        context 'ProverbFavoriteモデルとの関係' do
            it '1:Nとなっている' do
                expect(Proverb.reflect_on_association(:proverb_favorites).macro).to eq :has_many  
            end
        end

        context 'ProverbBookmarkモデルとの関係' do
            it '1:Nとなっている' do
                expect(Proverb.reflect_on_association(:proverb_bookmarks).macro).to eq :has_many  
            end
        end
    end

    describe "バリデーションのテスト" do
        let(:proverb) { create(:proverb) }
        
        context 'nameカラム' do
            it "空欄でないこと" do
            proverb.name = ''
            expect(proverb.valid?).to eq false;
            end

            it "30文字以内であること" do
            proverb.name = Faker::Lorem.characters(number:30)
            expect(proverb.valid?).to eq true;
            end

            it "31文字目で弾かれること" do
            proverb.name = Faker::Lorem.characters(number:31)
            expect(proverb.valid?).to eq false;
            end
        end
    
        context 'bodyカラム' do
            it "空欄でないこと" do
            proverb.body = ''
            expect(proverb.valid?).to eq false;
            end

            it "80文字以内あること" do
            proverb.body = Faker::Lorem.characters(number:80)
            expect(proverb.valid?).to eq true;
            end

            it "81文字目で弾かれること" do
            proverb.body = Faker::Lorem.characters(number:81)
            expect(proverb.valid?).to eq false;
            end
        end
    
        context 'introductionカラム' do
            it "空欄でないこと" do
            proverb.introduction = ''
            expect(proverb.valid?).to eq false;
            end

            it "500文字以内であること" do
            proverb.introduction = Faker::Lorem.characters(number:500)
            expect(proverb.valid?).to eq true;
            end

            it "501文字目で弾かれること" do
            proverb.introduction = Faker::Lorem.characters(number:501)
            expect(proverb.valid?).to eq false;
            end
        end
    end
end
