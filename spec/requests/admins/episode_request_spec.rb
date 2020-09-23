require 'rails_helper'

describe "管理者[エピソード関連] 非ログイン時" do
    let(:user) { create(:user) }
    let(:episode) { create(:episode, user: user) }

    context "以下のアクションにはアクセスできない" do
        
        it 'エピソード詳細ページ' do
            get admins_episode_path(episode)
            expect(response).to have_http_status 302
        end

        it 'エピソード削除アクション' do
            delete admins_episode_path(episode)
            expect(response).to have_http_status 302
        end
    end
end