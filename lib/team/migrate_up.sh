#!/bin/bash

#
# users関連
#
# devise_create_users
bundle exec rails db:migrate:up VERSION=20191114071843
# addresses
bundle exec rails db:migrate:up VERSION=20191114073028
# credit_cards
bundle exec rails db:migrate:up VERSION=20191115092531
# remove_profile_to_user
bundle exec rails db:migrate:up VERSION=20191116072934
# remove_profle_to_user
bundle exec rails db:migrate:up VERSION=20191116074025
# add_profle_to_user
bundle exec rails db:migrate:up VERSION=20191116074523
# change_telephone_to_user
bundle exec rails db:migrate:up VERSION=20191117103339


#
# items 関連
#
# item_conditions
bundle exec rails db:migrate:up VERSION=20191116093954
# ship_fee_bearers
bundle exec rails db:migrate:up VERSION=20191116094031
# days_before_ships
bundle exec rails db:migrate:up VERSION=20191116094116
# delivery_methods
bundle exec rails db:migrate:up VERSION=20191116094213
# brands
bundle exec rails db:migrate:up VERSION=20191116094241
# categories
bundle exec rails db:migrate:up VERSION=20191116094335
# categoris_trees
# 作成
bundle exec rails db:migrate:up VERSION=20191116094446
# 削除
bundle exec rails db:migrate:up VERSION=20191118060053
# categories_hierarchies (closure_treeで自動作成されるテーブル)
bundle exec rails db:migrate:up VERSION=20191118053904
# sizes
bundle exec rails db:migrate:up VERSION=20191116094636
# category_sizes
bundle exec rails db:migrate:up VERSION=20191116094602
# items 
bundle exec rails db:migrate:up VERSION=20191116093819
# item_imgages
bundle exec rails db:migrate:up VERSION=20191116093921

#
# usersとitemsができたあとにつくるもの(likes, comments, transactions)
#
# likes
bundle exec rails db:migrate:up VERSION=20191116092740
# comments
bundle exec rails db:migrate:up VERSION=20191116092905
# grades
bundle exec rails db:migrate:up VERSION=20191116093534
# payment_methods
bundle exec rails db:migrate:up VERSION=20191116093624
# transactions
bundle exec rails db:migrate:up VERSION=20191116093209

