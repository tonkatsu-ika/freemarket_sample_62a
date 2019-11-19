#!/bin/bash

# item_conditions
bundle exec rails db:migrate:up VERSION=20191116093954

# items 
bundle exec rails db:migrate:up VERSION=20191116093819

# item_imgages
bundle exec rails db:migrate:up VERSION=20191116093921

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


# category_sizes
bundle exec rails db:migrate:up VERSION=20191116094602
# sizes
bundle exec rails db:migrate:up VERSION=20191116094636

# ここから下は順番まだ考え中
# addresses
bundle exec rails db:migrate:up VERSION=20191114073028
# credit_cards
bundle exec rails db:migrate:up VERSION=20191115092531
# likes
bundle exec rails db:migrate:up VERSION=20191116092740
# comments
bundle exec rails db:migrate:up VERSION=20191116092905
# transactions
bundle exec rails db:migrate:up VERSION=20191116093209
# grades
bundle exec rails db:migrate:up VERSION=20191116093534
# payment_methods
bundle exec rails db:migrate:up VERSION=20191116093624



