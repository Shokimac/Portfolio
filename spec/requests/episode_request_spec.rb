require 'rails_helper'

describe "[エピソード関連]非ログイン時" do
    let(:user) { create(:user) }
    let(:episode) { create(:episode, user: user) }

    context "以下のアクションにはアクセスできない" do
        
        it 'エピソード投稿ページ' do
            get new_episode_path
            expect(response).to have_http_status 302
        end

        it 'エピソード新規投稿アクション' do
            post episodes_path
            expect(response).to have_http_status 302
        end

        it 'エピソード詳細ページ' do
            get episode_path(episode)
            expect(response).to have_http_status 302
        end

        it 'エピソードタイムラインページ' do
            get episodes_path
            expect(response).to have_http_status 302
        end

        it 'エピソード編集ページ' do
            get edit_episode_path(episode)
            expect(response).to have_http_status 302
        end

        it 'エピソード更新アクション' do
            patch episode_path(episode)
            expect(response).to have_http_status 302
        end

        it 'エピソード削除アクション' do
            delete episode_path(episode)
            expect(response).to have_http_status 302
        end
    end
end