require 'rails_helper'

describe '管理者 格言関連のテスト' do
    let(:user) { create(:user) }
    let(:user2) { create(:user) }
    let(:proverb) { create(:proverb, user: user) }
    let!(:otherComment) { create(:post_comment, user: user2, proverb: proverb) }

    before do
        visit new_admin_session_path
        fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
        fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
        click_button 'ログイン'
        visit admins_proverb_path(proverb)
    end

    context "格言詳細画面表示確認" do
        
        it '「格言主名 の格言」と表示されている' do
            expect(page).to have_content("#{proverb.name} の格言") 
        end

        it '格言が表示されている' do
            expect(page).to have_content proverb.body 
        end

        it '投稿ユーザー名が表示されている' do
            expect(page).to have_content user.name 
        end

        it "「この言葉を投稿した ユーザー名 さんのコメント」と表示される" do
            expect(page).to have_content("この言葉を投稿した #{user.name} さんのコメント") 
        end

        it '投稿者による格言へのコメントが表示されている' do
            expect(page).to have_content proverb.introduction 
        end

        it '「みんなのコメント」と表示されている' do
            expect(page).to have_content('みんなのコメント') 
        end

        it 'コメントを投稿したユーザーの名前が表示されている' do
            expect(page).to have_content user2.name 
        end

        it 'コメントを投稿したユーザーのプロフィール画像が表示されている' do
            expect(page).to have_css '.otherComment__image'
        end

        it 'コメントを投稿した日にちが表示されている' do
            expect(page).to have_content otherComment.created_at.strftime("%Y-%m-%d")
        end

        it 'コメントが表示されている' do
            expect(page).to have_content otherComment.comment
        end

        it '削除ボタンが表示されている' do
            expect(page).to have_link '削除する' 
        end
    end

    context "削除ボタンの動作テスト" do
        
        it '削除できる' do
            click_link '削除する'
            expect(current_path).to eq admins_tops_top_path 
        end
    end
    
    
end
