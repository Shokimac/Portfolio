Admin.create!(email:ENV['ADMIN_EMAIL'],password:ENV['ADMIN_PASSWORD'])
User.create!(name:'テストユーザー１',email:'ito@sample.com',password:'itoito')
DroppedLetter.create!(body:"テスト")