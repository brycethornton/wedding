# =============================================================================
# REQUIRED VARIABLES
# =============================================================================
# You must always specify the application and repository for every recipe. The
# repository must be the URL of the repository you want this recipe to
# correspond to. The deploy_to path must be the path on each machine that will
# form the root of the application path.

default_run_options[:pty] = true
set :repository,  "git://github.com/brycethornton/wedding.git"
set :scm, "git"
set :user, "root"
set :branch, "master"

# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true.

role :web,      "bryceandalex2009.com"
role :app,      "bryceandalex2009.com"
role :db,       "bryceandalex2009.com", :primary => true

# =============================================================================
# OPTIONAL VARIABLES
# =============================================================================

set :deploy_to, "/var/www/wedding"
set :use_sudo, false
set :deploy_via, :remote_cache

# =============================================================================
# TASKS
# =============================================================================
# Define tasks that run on all (or only some) of the machines. You can specify
# a role (or set of roles) that each task should be executed on. You can also
# narrow the set of servers to a subset of a role by specifying options, which
# must match the options given for the servers to select (like :primary => true)

namespace :deploy do

  task :after_default do
    cleanup
  end

  desc "Restart Application"
  task :restart do
    run "thin restart -C #{current_release}/config/thin.yml -R #{current_release}/config.ru"
  end

  desc "Start Application"
  task :start do
    run "thin start -C #{current_release}/config/thin.yml -R #{current_release}/config.ru"
  end
end
