desc 'whoami'
task :whoami do
  on roles(:all), in: :sequence, wait: 5 do
    execute :whoami
  end
end

