namespace :deploy do
  namespace :nginx do
    desc 'Start Nginx application'
    task :start do
      on roles(:web), in: :sequence, wait: 5 do
        sudo "service nginx start"
      end
    end

    desc 'Restart Nginx application'
    task :restart do
      on roles(:web), in: :sequence, wait: 5 do
        sudo "service nginx restart"
      end
    end

    desc 'Stop Nginx application'
    task :stop do
      on roles(:web), in: :sequence, wait: 5 do
        sudo "service nginx stop"
      end
    end
  end
end