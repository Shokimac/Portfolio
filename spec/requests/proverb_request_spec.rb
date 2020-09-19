require 'rails_helper'

describe "[格言関連]非ログイン時" do
    let(:user) { create(:user) }
    let(:proverb) { create(:proverb, user: user) }

end