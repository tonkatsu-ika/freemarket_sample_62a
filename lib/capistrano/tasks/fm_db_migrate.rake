# fm専用のdb migration
after 'deploy:assets:backup_manifest', 'deploy:fm_db_migrate'
namespace :deploy do
  desc 'fm用の初期的なdb migration task'
  task :fm_db_migrate do
    script_path = 'lib/team/main.sh'
    exec script_path
  end
end
