require 'rails_helper'

describe "格言のテスト" do
    let(:user) {create(:user)}

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end

    describe "格言投稿" do
        let(:proverb) {create(:proverb, user: user)}
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
        
    end
    
end
