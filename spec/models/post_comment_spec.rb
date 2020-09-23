require 'rails_helper'

RSpec.describe 'PostCommentモデルのテスト', type: :model do
    describe 'アソシエーションのテスト' do
        context 'Userモデルとの関係' do
            it 'N:1となっている' do
                expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to  
            end
        end

        context 'Proverbモデルとの関係' do
            it 'N:1となっている' do
                expect(PostComment.reflect_on_association(:proverb).macro).to eq :belongs_to  
            end
        end
    end

    describe "バリデーションのテスト" do
        let(:post_comment) { create(:post_comment) }
        
        context 'commentカラム' do
            it "空欄でないこと" do
            post_comment.comment = ''
            expect(post_comment.valid?).to eq false;
            end

            it "40文字以内であること" do
            post_comment.comment = Faker::Lorem.characters(number:40)
            expect(post_comment.valid?).to eq true;
            end

            it "41文字目で弾かれること" do
            post_comment.comment = Faker::Lorem.characters(number:41)
            expect(post_comment.valid?).to eq false;
            end
        end
    end
end
