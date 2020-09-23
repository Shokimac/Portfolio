require 'rails_helper'

describe "問い合わせテスト" do
        
        context "問い合わせ画面の表示確認" do
            before do
                visit new_inquiries_path
            end

            it 'ラベルに「お名前」と表示されている' do
                expect(page).to have_content('お名前')
            end

            it '名前入力フォームが表示されている' do
                expect(page).to have_field 'inquiry[name]' 
            end

            it 'ラベルに「お問い合わせ内容」と表示されている' do
                expect(page).to have_content('お問い合わせ内容') 
            end

            it '問い合わせ内容入力フォームが表示されている' do
                expect(page).to have_field 'inquiry[message]' 
            end

            it '送信ボタンが表示されている' do
                expect(page).to have_button '送信' 
            end
        end

        context "送信テスト" do
            before do
                visit new_inquiries_path
            end

            it 'メールの送信に成功する' do
                fill_in "inquiry[name]",	with: "test user"
                fill_in "inquiry[message]",	with: "send test"
                click_button '送信'
                expect(current_path).to eq root_path
            end

            it 'フォームが空白の場合、失敗する' do
                fill_in "inquiry[name]",	with: ""
                fill_in "inquiry[message]",	with: ""
                click_button '送信'
                expect(page).to have_content("お名前が空になっているので入力をお願いいたします。")
                expect(page).to have_content("お問い合わせ内容が空になっているので入力をお願いいたします。")
            end
        end
end
