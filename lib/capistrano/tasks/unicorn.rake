namespace :deploy do
  namespace :unicorn do
    desc 'Start Unicorn application'
    task :start do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "service unicorn_#{fetch(:full_app_name)} start"
      end
    end

    desc 'Restart Unicorn application'
    task :restart do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "service unicorn_#{fetch(:full_app_name)} restart"
      end
    end

    desc 'Stop Unicorn application'
    task :stop do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "service unicorn_#{fetch(:full_app_name)} stop"
      end
    end
  end
end