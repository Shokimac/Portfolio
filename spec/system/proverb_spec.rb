require 'rails_helper'

describe "格言のテスト" do
    let!(:user) {create(:user)}
    let!(:user2) {create(:user)}
    let!(:proverb) {create(:proverb, user: user)}
    let!(:proverb2) {create(:proverb, user: user2)}

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
            it '投稿に成功する' do
                fill_in "proverb[body]",	with: Faker::Lorem.characters(number:20)
                fill_in "proverb[name]",	with: Faker::Lorem.characters(number:10) 
                fill_in "proverb[introduction]",	with: Faker::Lorem.characters(number:50)
                click_button '投稿する'
                expect(current_path).to eq proverbs_path 
            end

            it 'フォームが空白のままだと投稿に失敗する' do
                fill_in "proverb[body]",	with: ""
                fill_in "proverb[name]",	with: ""
                fill_in "proverb[introduction]",	with: ""
                click_button '投稿する'
                expect(page).to have_content("格言主の名前が空になっているので、投稿できません。")
                expect(page).to have_content("格言が空になっているので、投稿できません。")
                expect(page).to have_content("コメントが空になっているので、投稿できません。")
            end
        end
    end

    describe "格言編集" do
        context "編集画面へのアクセス" do
            it '自分の投稿した格言編集画面へアクセスできる' do
                visit edit_proverb_path(proverb)
                expect(current_path).to eq edit_proverb_path(proverb)
            end

            it '他人の投稿した格言編集画面にはアクセスできない' do
                visit edit_proverb_path(proverb2)
                expect(current_path).to eq  user_path(user)
            end
        end
        
        context "格言編集画面表示の確認" do
            before do
                visit edit_proverb_path(proverb)
            end

            it '「格言編集」と表示される' do
                expect(page).to have_content('格言編集') 
            end

            it 'ラベルに「格言」と表示される' do
                expect(page).to have_content('格言')
            end

            it '格言入力フォームに投稿した格言が入っている' do
                expect(page).to have_field 'proverb[body]', with: proverb.body 
            end

            it 'ラベルに「誰の格言か」と表示される' do
                expect(page).to have_content('誰の格言か')
            end

            it '格言主の名前入力フォームに投稿した名前が入っている' do
                expect(page).to have_field 'proverb[name]' , with: proverb.name
            end

            it 'ラベルに「格言に対してのコメント」と表示される' do
                expect(page).to have_content('格言に対してのコメント')
            end

            it 'コメント入力フォームに投稿したコメントが入っている' do
                expect(page).to have_field 'proverb[introduction]', with: proverb.introduction 
            end

            it '投稿ボタンが表示されている' do
                expect(page).to have_button '更新する' 
            end
        end

        context "編集テスト" do
            before do
                visit edit_proverb_path(proverb)
            end

            it '編集が成功する' do
                fill_in "proverb[body]",	with: Faker::Lorem.characters(number:20)
                fill_in "proverb[name]",	with: Faker::Lorem.characters(number:10)
                click_button '更新する'
                expect(current_path).to eq proverb_path(proverb) 
            end

            it 'フォーム空白で編集が失敗する' do
                fill_in "proverb[body]",	with: ""
                fill_in "proverb[name]",	with: ""
                fill_in "proverb[introduction]",	with: "" 
                click_button '更新する'
                expect(page).to have_content("格言主の名前が空になっているので、投稿できません。")
                expect(page).to have_content("格言が空になっているので、投稿できません。")
                expect(page).to have_content("コメントが空になっているので、投稿できません。")
            end
        end
    end

    describe "格言詳細" do
        context "編集＆削除ボタンの表示" do
            it '自分の投稿へアクセス時、ボタンが表示される' do
                visit proverb_path(proverb)
                expect(page).to have_link '編集する' 
                expect(page).to have_link '削除する' 
            end

            it '他人の投稿へアクセス時、ボタンが表示されない' do
                visit proverb_path(proverb2)
                expect(page).to have_no_link '編集する'
                expect(page).to have_no_link '削除する'
            end
        end

        context "画面表示の確認" do
            let!(:user_comment) { create(:post_comment, user: user, proverb: proverb2) }
            before do
                visit proverb_path(proverb2)
            end

            it '格言主の名前が表示されている' do
                expect(page).to have_content proverb2.name
            end

            it '格言が表示されている' do
                expect(page).to have_content proverb2.body 
            end

            it 'いいねボタンが表示されている' do
                expect(page).to have_css('.showProverb__favoriteButton') 
            end

            it 'お気に入りボタンが表示されている' do
                expect(page).to have_css('.showProverb__bookmarkButton') 
            end

            it '投稿者の名前が表示されている' do
                expect(page).to have_content user2.name
            end

            it '投稿者のコメントが表示されている' do
                expect(page).to have_content proverb2.introduction 
            end

            it '「みんなのコメント」と表示されている' do
                expect(page).to have_content('みんなのコメント') 
            end

            it 'コメントを投稿したユーザーの名前が表示されている' do
                expect(page).to have_content user.name 
            end
    
            it 'コメントを投稿したユーザーのプロフィール画像が表示されている' do
                expect(page).to have_css '.comment__image'
            end
    
            it 'コメントを投稿した日にちが表示されている' do
                expect(page).to have_content user_comment.created_at.strftime("%Y-%m-%d")
            end
    
            it 'コメントが表示されている' do
                expect(page).to have_content user_comment.comment
            end

            it 'コメント投稿フォームが表示されている' do
                expect(page).to have_field 'post_comment[comment]' 
            end

            it 'コメント投稿ボタンが表示されている' do
                expect(page).to have_button '投稿' 
            end
        end

        context "コメント投稿テスト" do
            before do
                visit proverb_path(proverb2)
            end

            it '空白ではコメント投稿できない' do
                fill_in "post_comment[comment]",	with: ""
                click_button '投稿'
                expect(page).to have_content("コメントを入力して下さい。")
            end
            
            it 'コメント投稿できる' do
                fill_in "post_comment[comment]",	with: Faker::Lorem.characters(number:5)
                click_button '投稿'
                expect(current_path).to eq proverb_path(proverb2)
            end

        end
    end

    describe "格言タイムライン" do
        context "表示の確認" do
            before do
                visit proverbs_path
            end

            it '「みんなの格言」と表示される' do
                expect(page).to have_content('みんなの格言') 
            end

            it 'いいねランキングが表示されている' do
                expect(page).to have_content('いいねランキング') 
            end

            it 'いいね件数が表示されている' do
                expect(page).to have_content("いいね件数： #{proverb.proverb_favorites.count} 件") 
            end

            it 'ランキングの１位が King' do
                
            end

            it 'タイムラインに投稿された格言主の名前が表示されている' do
                expect(page).to have_content proverb2.name
            end

            it 'タイムラインに投稿したユーザーの名前が表示されている' do
                expect(page).to have_content user2.name 
            end

            it '自分のプロフィール画像が表示されている' do
                expect(page).to have_css('.userProfile__image') 
            end

            it '自分のユーザー名が表示されている' do
                expect(page).to have_content('ユーザー名：') 
            end

            it 'エピソード投稿ボタンが表示されている' do
                expect(page).to have_link '格言投稿' 
            end

            it 'エピソード投稿ボタンのリンク先が正しい' do
                click_link '格言投稿'
                expect(current_path).to eq new_proverb_path 
            end

            it '格言検索ボタンが表示されている' do
                expect(page).to have_link '格言検索' 
            end

            it '格言検索ボタンのリンク先が正しい' do
                click_link '格言検索'
                expect(current_path).to eq proverbs_search_path 
            end

            it 'プロフィール編集ボタンが表示されている' do
                expect(page).to have_link 'プロフィール編集' 
            end

            it 'プロフィールボタンのリンク先が正しい' do
                click_link 'プロフィール編集'
                expect(current_path).to eq edit_user_path(user)
            end

            it 'お気に入り一覧ボタンが表示されている' do
                expect(page).to have_link 'お気に入り一覧' 
            end

            it 'お気に入り一覧ボタンのリンク先が正しい' do
                click_link 'お気に入り一覧'
                expect(current_path).to eq user_bookmarks_path(user) 
            end
        end

        context "投稿数が5個の場合のページネーション表示確認" do
            let!(:proverb) { create_list(:proverb, 5, user: user) }
            before do
                visit user_path(user)
            end

            it 'ページネーションが表示されない' do
                expect(page).to_not have_content('1 2 Next Last')
            end
        end

        context "投稿数が6個の場合のページネーション表示確認" do
            let!(:proverb) { create_list(:proverb, 6, user: user) }
            before do
                visit user_path(user)
            end

            it 'ページネーションが表示される' do
                expect(page).to have_content('1 2 Next Last')
            end
        end
    end
end
