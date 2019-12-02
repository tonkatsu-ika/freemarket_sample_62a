desc '.env.productionの読み込み'
task :fm_load_remote_environment do
  on roles(:app) do
    set :default_environment, Dotenv::Parser.call(capture("cat #{shared_path}/.env.production"))
  end
end


after 'deploy:publishing', 'fm_load_remote_environment'
