# fm専用のdb migration
after 'deploy:assets:backup_manifest', 'deploy:fm_db_migrate'
namespace :deploy do
  desc 'fm用の初期的なdb migration task'
  task :fm_db_migrate do
    on roles(:all) do
      with rails_env: fetch(:rails_env) do
        script_path = '/lib/team/main.sh'
        # exec script_path
        execute "#{current_path}#{script_path}"
        p current_path
        info "Host #{host} (#{host.roles.to_a.join(', ')}"
      end
    end
  end
end
