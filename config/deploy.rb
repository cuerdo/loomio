set :application, 'loomio'
set :repo_url, 'https://github.com/piratas-ar/loomio'
set :linked_files, %w{.env}

set :rbenv_type, :user
set :rbenv_ruby, '2.2.0'


set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}
set :rbenv_roles, :all # default value

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'delayed_job:restart'
  end
end
