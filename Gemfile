# source 'https://rubygems.org'
source 'http://ruby.taobao.org'

ruby '2.2.0'

gem 'rails', '4.2.0'

# DB
gem 'mysql2'

group :development do
  # Deploy
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
  gem 'capistrano3-nginx'

  # Other
end

group :production do
  gem 'unicorn'
end