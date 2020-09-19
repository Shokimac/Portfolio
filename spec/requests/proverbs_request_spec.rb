require 'rails_helper'

describe "[格言関連]非ログイン時" do
    let(:user) { create(:user) }
    let(:proverb) { create(:proverb, user: user) }

    context "以下のアクションにはアクセスできない" do
        
        it '格言投稿ページ' do
            get new_proverb_path
            expect(response).to have_http_status 302
        end

        it '格言新規投稿アクション' do
            post proverbs_path
            expect(response).to have_http_status 302
        end

        it '格言詳細ページ' do
            get proverb_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言タイムラインページ' do
            get proverbs_path
            expect(response).to have_http_status 302
        end

        it '格言編集ページ' do
            get edit_proverb_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言更新アクション' do
            patch proverb_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言削除アクション' do
            delete proverb_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言検索ページ' do
            get proverbs_search_path
            expect(response).to have_http_status 302
        end

        it '格言 いいねアクション' do
            post proverb_proverb_favorites_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言 いいね削除アクション' do
            delete proverb_proverb_favorites_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言 ブックマークアクション' do
            post proverb_proverb_bookmarks_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言 ブックマーク削除アクション' do
            delete proverb_proverb_bookmarks_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言 コメント投稿アクション' do
            post proverb_post_comments_path(proverb)
            expect(response).to have_http_status 302
        end

        it '格言 コメント削除アクション' do
            delete proverb_post_comments_path(proverb)
            expect(response).to have_http_status 302
        end
    end
end