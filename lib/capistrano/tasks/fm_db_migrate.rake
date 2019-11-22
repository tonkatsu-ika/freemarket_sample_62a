# fm専用のdb migration

# migrationの順番
mig_order = [
  20191114071843,
  20191114073028,
  20191115092531,
  20191116072934,
  20191116074025,
  20191116074523,
  20191117103339,
  20191116093954,
  20191116094031,
  20191116094116,
  20191116094213,
  20191116094241,
  20191116094335,
  20191116094446,
  20191118060053,
  20191118053904,
  20191116094636,
  20191116094602,
  20191116093819,
  20191116093921,
  20191116092740,
  20191116092905,
  20191116093534,
  20191116093624,
  20191116093209
]
 

# task本体
namespace :deploy do

  desc 'fm用のconditional migration'
  task :fm_db_migrate do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          info '[deploy:fm_db_migrate]: conditional migration'
          conditionally_migrate = fetch(:conditionally_migrate)
          if conditionally_migrate && test(:diff, "-qr #{release_path}/db #{current_path}/db")
            info '[deploy:migrate] Skip `deploy:migrate` (nothing changed in db)'
          else
            info '[deploy:migrate] Run `deploy:fm_db_migrate`'
            invoke :'deploy:fm_db_migrating'
          end

        end
      end
    end
  end

  desc 'fm用の初期的なdb migration task'
  task :fm_db_migrating do
    on roles(:all) do
     on fetch(:migration_servers) do
       within release_path do 
         with rails_env: fetch(:rails_env) do

           info '[deploy:fm_db_migrating]'

           mig_order.each do |mig_ver|
             execute :bundle, "exec rails db:migrate:up VERSION=#{mig_ver}"
           end

           info "Host #{host} (#{host.roles.to_a.join(', ')})"
           # migrationがうまくいった場合のロジックを追加する
           #invoke :'deploy:fm_db_seed_fu'

         end
       end
     end
    end
  end

  desc 'dbへのシード投入'
  task :fm_db_seed_fu do
    on roles(:all) do
      within release_path do
        with rails_env: fetch(:rails_env) do

          execute :bundle, 'exec rails db:seed_fu'
          info "Host #{host} (#{host.roles.to_a.join(', ')})"

        end
      end
    end
  end

end

# taskの順番
after 'deploy:assets:backup_manifest', 'deploy:fm_db_migrate'

