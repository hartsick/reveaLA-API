# config valid only for Capistrano 3.1
set :pty, true
set :pg_ask_for_password, true

set :stages, %w()
set :deploy_to, "/var/www/reveaLA-API"
set :scm, 'git'
set :scm_verbose, true
set :application, 'reveaLAAPI'
set :repo_url, 'git@github.com:hartsick/reveaLA-API.git'
set :branch, 'master'
set :linked_files, ['config/database.yml', 'config/secrets.yml']
set :linked_dirs, ['log', 'db_backups']
set :deploy_via, :remote_cache
set :rvm_ruby_version, '2.1.1'

set :runner, 'root'
set :group, 'web'
