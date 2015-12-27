# config valid only for current version of Capistrano
lock '3.1.0'

set :application, 'blog.lorenzosinisi'
set :repo_url, 'git@github.com:lorenzosinisi/blog.lorenzosinisi.com.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/blog.lorenzosinisi'

# Default value for :scm is :git
# set :scm, :git
set :bundle_binstubs, nil
# Default value for :format is :pretty
set :format, :pretty
set :linked_files, %w{config/database.yml config/secrets.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 10




namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

namespace :workers do
  namespace :whenever do
    desc "Stop whenever"
    task :stop do
      on roles(:app) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :bundle, :exec, "whenever -c"
          end
        end
      end
    end

    desc "Whenever status"
    task :status do
      on roles(:app) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :bundle, :exec, "crontab -l"
          end
        end
      end
    end

    desc "Start Whenever"
    task :start do
      on roles(:app) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute "whenever --update-crontab"
          end
        end
      end
    end

    def cw_log_dir
      "#{shared_path}/log"
    end
    def cw_pid_dir
      "#{shared_path}/tmp/pids"
    end


    def rails_env
      fetch(:rails_env, false) ? "RAILS_ENV=#{fetch(:rails_env)}" : ''
    end
  end

  namespace :delayed_job do
    def args
      fetch(:delayed_job_args, "") #Useful for queuing on specific servers
    end

    def delayed_job_roles
      fetch(:delayed_job_server_role, :app)
    end

    desc 'Stop the delayed_job process'
    task :stop do
      on roles(delayed_job_roles) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :bundle, :exec, :'bin/delayed_job', :stop
          end
        end
      end
    end

    desc 'Start the delayed_job process'
    task :start do
      on roles(delayed_job_roles) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :bundle, :exec, :'bin/delayed_job', args, :start
          end
        end
      end
    end

    desc 'Restart the delayed_job process'
    task :restart do
      on roles(delayed_job_roles) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :bundle, :exec, :'bin/delayed_job', args, :restart
          end
        end
      end
    end

  end
end
