require 'rails_helper'

describe "エピソードのテスト" do
    let(:user) { create(:user) }

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end

    describe "エピソード投稿" do
        let!(:episode) { create(:episode) }
        before do
            visit new_episode_path
        end

        context "表示の確認" do
            it '「エピソード投稿」と表示される' do
                expect(page).to have_content('エピソード投稿') 
            end

            it 'ラベルに「タイトル」と表示される' do
                expect(page).to have_content('タイトル') 
            end

            it 'タイトル入力フォームが表示される' do
                expect(page).to have_field 'episode[title]' 
            end

            it 'ラベルに「内容」と表示される' do
                expect(page).to have_content('内容')
            end

            it '内容入力フォームが表示される' do
                expect(page).to have_field 'episode[body]'
            end

            it '投稿ボタンが表示される' do
                expect(page).to have_button '投稿する' 
            end
        end

        context "投稿テスト" do
            it '投稿に成功する' do
                fill_in "episode[title]",	with: episode.title 
                fill_in "episode[body]",	with: episode.body
                click_button '投稿する'
                expect(page).to have_content('エピソードを投稿しました')
            end

            it '投稿に失敗する' do
                fill_in "episode[title]",	with: ""
                fill_in "episode[body]",	with: ""
                click_button '投稿する'
                expect(page).to have_content("can't be blank")
            end
        end

        
        
        
    end
    
end
