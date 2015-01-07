# config valid only for Capistrano 3.3.5
# lock '3.3.5'


set :application, 'genesis'
set :deploy_user, 'deploy'

set :stages, %w(prod staging)
set :default_stage, "prod"

set :scm, :git
set :repo_url, 'git@git.oschina.net:lanvige/genesis_web.git'

# rbenv
set :rbenv_type, :system
set :rbenv_ruby, '2.2.0'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# unicorn
set :unicorn_config_path, -> { "#{shared_path}/config/unicorn.rb" }

## log_level:: trace debug info warn error
set :log_level, :trace

# how many old releases do we want to keep, not much
set :keep_releases, 5

# files we want symlinking to specific entries in shared
set :linked_files, %w{
  config/database.yml
  config/secrets.yml
}

# dirs we want symlinking to shared
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

set :pty, true

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set :config_files, %w(
  database.example.yml
  secrets.example.yml
  nginx.conf
  unicorn.rb
  unicorn_init.sh
  log_rotation
  monit
)

# which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(
  unicorn_init.sh
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc. The full_app_name variable isn't
# available at this point so we use a custom template {{}}
# tag and then add it at run time.
set(:symlinks, [
    {
        source: "nginx.conf",
        link: "/etc/nginx/sites-enabled/{{full_app_name}}"
    },
    {
        source: "unicorn_init.sh",
        link: "/etc/init.d/unicorn_{{full_app_name}}"
    },
    {
      source: "log_rotation",
      link: "/etc/logrotate.d/{{full_app_name}}"
    }
    # {
    #   source: "monit",
    #   link: "/etc/monit/conf.d/{{full_app_name}}.conf"
    # }
])

# this:
# http://www.capistranorb.com/documentation/getting-started/flow/
# is worth reading for a quick overview of what tasks are called
# and when for `cap stage deploy`

namespace :deploy do
  desc 'Restart application'
  after 'deploy:publishing', 'deploy:restart'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
      # Restart the App & Web services
      # after 'deploy:publishing', 'deploy:unicorn:restart'
      # after 'deploy:unicorn:restart', 'deploy:nginx:restart'
      invoke 'unicorn:reload'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
