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

# brands
bundle exec rails db:migrate:up VERSION=20191116094241

#20191114073028_create_addresses.rb
#20191115092531_create_credit_cards.rb
#20191116092740_create_likes.rb
#20191116092905_create_comments.rb
#20191116093209_create_transactions.rb
#20191116093534_create_grades.rb
#20191116093624_create_payment_methods.rb

#20191116094335_create_categories.rb
#20191116094446_create_categories_trees.rb
#20191116094602_create_category_sizes.rb
#20191116094636_create_sizes.rb
