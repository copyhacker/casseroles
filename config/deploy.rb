require 'mongrel_cluster/recipes'

set :application, "casseroles"
# set :repository,  "git+ssh://casserolesdeploy@dev.elevatedrails.com/var/git/clients/casseroles"
set :repository,  "git@github.com:gravelpup/casseroles.git"


# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

case ENV['DEPLOY_TO']
when 'staging'
  role :app, "dizzy.elevatedrails.com"
  role :web, "dizzy.elevatedrails.com"
  role :db,  "dizzy.elevatedrails.com", :primary => true
  set :user, "casserolesdeploy"
  set :use_sudo, false
  set :deploy_to, "/u/staging/apps/#{application}"
  set :mongrel_conf, "#{current_path}/config/mongrel_staging.yml"
  set :rails_env, "staging"
when 'production'
  role :app, "basie.elevatedrails.com"
  role :web, "basie.elevatedrails.com"
  role :db,  "basie.elevatedrails.com", :primary => true
  set :user, "casserolesdeploy"
  set :use_sudo, false
  set :deploy_to, "/u/apps/#{application}"
  set :mongrel_conf, "#{current_path}/config/mongrel.yml"
  set :rails_env, "production"
else  warn "I only know how to deploy to staging or production"
  warn "Try prepending DEPLOY_TO=staging."
  exit(1)
end

namespace :deploy do
  namespace :web do
    task :disable do
      run "cp #{current_path}/public/maintenance.html #{shared_path}/system/maintenance.html"
    end
  end
  
  desc "Setup to be run"
  task :after_update_code do
    # Link up the production database (temp)
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"

    # Link up the restful_auth site keys
    run "ln -nfs #{shared_path}/system/site_keys.rb #{release_path}/config/initializers/site_keys.rb"
  end
end

namespace :deploy do
  task :full do
    transaction do
      update_code
      web.disable
      symlink
      migrate
    end

    restart
    web.enable
    cleanup
  end
end

