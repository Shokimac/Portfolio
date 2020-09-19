require 'rails_helper'

describe "管理者認証" do
    describe "管理者ログイン" do
        context "ログインテスト" do
            
            it '成功する' do
                visit new_admin_session_path
                fill_in "admin[email]",	with: ENV['ADMIN_EMAIL']
                fill_in "admin[password]",	with: ENV['ADMIN_PASSWORD']
                click_button 'ログイン'
                expect(page).to have_content('Signed in successfully.')
            end

            it '失敗する' do
                visit new_admin_session_path
                fill_in "admin[email]",	with: ""
                fill_in "admin[password]",	with: ""
                click_button 'ログイン'
                expect(current_path).to eq new_admin_session_path
            end
        end
    end
end
