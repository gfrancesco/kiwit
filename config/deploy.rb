set :application, "kiwit"
set :repository,  "https://github.com/gfrancesco/kiwit.git"
set :use_sudo, false
set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, 'deployer'
set :deploy_to, "/home/#{application}/www/app/#{application}"


set :normalize_asset_timestamps, false

server "178.79.160.46", :app, :web, :db, :primary => true

set :rbenv_root, "/usr/local/rbenv"
set :default_environment, {
  'PATH' => "#{rbenv_root}/shims:#{rbenv_root}/bin:$PATH"
}

namespace :deploy do

  desc "Create shared directories."
  task :create_shared_dir do
    run "mkdir -p #{shared_path}/assets/img #{shared_path}/assets/bootstrap
      #{shared_path}/sockets #{shared_path}/assets/js #{shared_path}/assets/css"
  end

end

namespace :bundle do
  
  desc "Clean outdated GEMs."
  task :clean do
    run "cd #{deploy_to}/current && bundle clean"
  end

end

after 'deploy:setup', 'deploy:create_shared_dir'

after "deploy:restart", "deploy:cleanup"

after "deploy:restart", "unicorn:reload"
after "deploy:restart", "unicorn:restart"

require 'bundler/capistrano'
require 'capistrano-unicorn'