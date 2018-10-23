require 'dotenv/load'
require 'jekyll'
require 'rsync'

task default: %w[serve]

task :build do
  puts "- Building site...".green.bold
  Jekyll::Commands::Build.process(profile: true)
end

task :serve do
  puts "- Serving site...".green.bold
  Jekyll::Commands::Serve.start(watch: true, serving: true)
end

task :clean do
  puts "- Cleaning up...".green.bold
  Jekyll::Commands::Clean.process({})
end

task :deploy => [:clean, :set_production, :build] do
  remote_path = ENV['REMOTE_PATH']
  if remote_path.to_s.empty?
    fail "- ENV['REMOTE_PATH'] has not been set.".red.bold
  end

  puts "- Deploying site to #{remote_path}...".cyan.bold

  options = %w(-avzq --delete --exclude=.DS_Store)
  Rsync.run('_site/', remote_path, options) do |result|
    if result.success?
      puts "- Deployment successful!".green.bold
    else
      puts "- Deployment failed.\n#{result.error}".red.bold
    end
  end
end

task :set_production do
  ENV['JEKYLL_ENV'] = 'production'

  puts "- Using #{ENV['JEKYLL_ENV'].upcase} environment.".bg_red.bold
end

# Utilities

class String
  def black; "\e[30m#{self}\e[0m" end
  def red; "\e[31m#{self}\e[0m" end
  def green; "\e[32m#{self}\e[0m" end
  def brown; "\e[33m#{self}\e[0m" end
  def blue; "\e[34m#{self}\e[0m" end
  def magenta; "\e[35m#{self}\e[0m" end
  def cyan; "\e[36m#{self}\e[0m" end
  def gray; "\e[37m#{self}\e[0m" end

  def bg_black; "\e[40m#{self}\e[0m" end
  def bg_red; "\e[41m#{self}\e[0m" end
  def bg_green; "\e[42m#{self}\e[0m" end
  def bg_brown; "\e[43m#{self}\e[0m" end
  def bg_blue; "\e[44m#{self}\e[0m" end
  def bg_magenta; "\e[45m#{self}\e[0m" end
  def bg_cyan; "\e[46m#{self}\e[0m" end
  def bg_gray; "\e[47m#{self}\e[0m" end

  def bold; "\e[1m#{self}\e[22m" end
  def italic; "\e[3m#{self}\e[23m" end
  def underline; "\e[4m#{self}\e[24m" end
  def blink; "\e[5m#{self}\e[25m" end
  def reverse_color; "\e[7m#{self}\e[27m" end
end
