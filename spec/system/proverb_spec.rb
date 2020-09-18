require 'rails_helper'

describe "格言のテスト" do
    let(:user) {create(:user)}
    let(:user2) {create(:user)}
    let(:proverb) {create(:proverb, user: user)}
    let(:proverb2) {create(:proverb, user: user2)}


    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end

    describe "格言投稿" do
        before do
            visit new_proverb_path
        end

        context "投稿画面の表示確認" do
            it '「格言投稿」と表示される' do
                expect(page).to have_content('格言投稿') 
            end

            it 'ラベルに「格言」と表示される' do
                expect(page).to have_content('格言')
            end

            it '格言入力フォームが表示されている' do
                expect(page).to have_field 'proverb[body]' 
            end

            it 'ラベルに「誰の格言か」と表示される' do
                expect(page).to have_content('誰の格言か')
            end

            it '格言主の名前入力フォームが表示されている' do
                expect(page).to have_field 'proverb[name]' 
            end

            it 'ラベルに「格言に対してのコメント」と表示される' do
                expect(page).to have_content('格言に対してのコメント')
            end

            it 'コメント入力フォームが表示されている' do
                expect(page).to have_field 'proverb[introduction]' 
            end

            it '投稿ボタンが表示されている' do
                expect(page).to have_button '投稿する' 
            end
        end

        context "格言投稿のテスト" do
            it '成功する' do
                fill_in "proverb[body]",	with: Faker::Lorem.characters(number:20)
                fill_in "proverb[name]",	with: Faker::Lorem.characters(number:10) 
                fill_in "proverb[introduction]",	with: Faker::Lorem.characters(number:50)
                click_button '投稿する'
                expect(current_path).to eq proverbs_path 
            end

            it '失敗する' do
                fill_in "proverb[body]",	with: ""
                fill_in "proverb[name]",	with: ""
                fill_in "proverb[introduction]",	with: ""
                click_button '投稿する'
                expect(page).to have_content("can't be blank")
            end
        end
    end

    describe "格言編集" do
        context "画面へのアクセステスト" do
            it '自分の投稿した格言編集画面へアクセスできる' do
                visit edit_proverb_path(proverb)
                expect(current_path).to eq edit_proverb_path(proverb)
            end

            it '他人の投稿した格言編集画面にはアクセスできない' do
                visit edit_proverb_path(proverb2)
                expect(current_path).to eq  user_path(user)
            end
        end
        
    end
    
    
end
