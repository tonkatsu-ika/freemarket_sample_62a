crumb :root do
  link "Fmarket", root_path
end

# Fmarketの子

crumb :mypage do
  link "マイページ", mypage_index_path
  parent :root
end

# マイページの子

crumb :profile do
  link "プロフィール", profile_mypage_index_path
  parent :mypage
end

crumb :card do
  link "支払い方法", card_mypage_index_path
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_mypage_index_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypage_index_path
  parent :mypage
end

crumb :like do
  link "いいね！一覧", like_mypage_index_path
  parent :mypage
end

crumb :listing do
  link "出品した商品-出品中", listing_mypage_index_path
  parent :mypage
end


# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).