#!/bin/bash

# item_conditions
bundle exec rails db:migrate:down VERSION=20191116093954


# item_imgages
bundle exec rails db:migrate:down VERSION=20191116093921

# ship_fee_bearers
bundle exec rails db:migrate:down VERSION=20191116094031

# days_before_ships
bundle exec rails db:migrate:down VERSION=20191116094116

# delivery_methods
bundle exec rails db:migrate:down VERSION=20191116094213

# brands
bundle exec rails db:migrate:down VERSION=20191116094241

# item
#bundle exec rails db:migrate:down VERSION=20191116093819

