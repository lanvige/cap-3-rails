# encoding: UTF-8

set :stage, :production
set :branch, 'master'

# This is used in the Nginx VirtualHost to specify which domains
# the app should appear on. If you don't yet have DNS setup, you'll
# need to create entries in your local Hosts file for testing.
set :server_name, "www.d2labs.cn"

# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}"

# Extended Server Syntax
server '115.28.65.119', user: 'deploy', roles: %w{web app db}

# where to put the app
# set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :production
set :migrate_env, :production

# number of unicorn workers, this will be reflected in
# the unicorn.rb and the monit configs
set :unicorn_worker_count, 5

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false
set :pty, false

## sidekiq
# set :sidekiq_concurrency, 10
# set :sidekiq_queue, ['sms', 'notification', 'default']
# set :sidekiq_queue, ['sms,2', 'client_emails,5', 'default,3', 'foo']
# set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
