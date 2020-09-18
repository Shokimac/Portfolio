require 'rails_helper'

describe "格言のテスト" do
    let(:user) {create(:user)}

    before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
    end
    
end
