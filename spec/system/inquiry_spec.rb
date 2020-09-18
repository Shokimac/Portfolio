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
    
end
