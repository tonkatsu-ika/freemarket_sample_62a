#!/bin/bash

source ./lib/team/drop_and_create_dbs.sh
source ./lib/team/migrate_up.sh

bundle exec rails db:seed_fu
