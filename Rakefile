
require 'fileutils'
include FileUtils
#this will print 'thank you' when you run rake (needs a default thought)
namespace :greetings do
  desc "prints thank you"
  task :thank_you do
    puts "thank you"
  end
  desc "greet someone"
  task :hello, [:name] do |cmd, args|
    puts "Hello, #{args[:name]}"
  end
end

task :default do
  puts "Hello, this is the default task"
end

namespace :cake do
  desc "Bake a Cake"
  task :bake => [:mix_up, :go_to_store] do
    puts "Cake is baked"
  end

  task :mix_up => [:add_flower, :add_eggs] do
    puts "Mix up ingredients"
  end

  task :add_flower => :get_flower do
    puts "Adding flower"
  end

  task :add_eggs => :go_to_store do
    puts "Adding Eggs"
  end

  task :get_flower => :go_to_store do
    puts "Get Flower"
  end

  task :go_to_store do
    puts "Go to Store"
  end
  desc "how do I spell"
  task :learn_to_spell, [:word] do  |cmd, args|
    puts "need to learn to spell, #{args[:word]}"
  end
end

namespace :dozer do

  desc "print ENV"
  task :env do
    sh("ENV")
  end

  desc "print PWD"
  task :pwd do
    #both are the same
    sh("pwd")
    system("pwd")
  end

  desc "add views for a resource"
  task :make_views, [:resource_name] do  |cmd, args|
    resource = args[:resource_name]
    sh("mkdir views/#{resource}")
    touch("views/#{resource}/index.erb")
    touch("views/#{resource}/show.erb")
    touch("views/#{resource}/edit.erb")
    touch("views/#{resource}/new.erb")
  end

  desc "move Stylesheets"
  task :move_stylesheets => :create_assets do
    # move all stylesheets out of `public` and into `your_project/assets/stylesheets`
    sh("cp -a public/stylesheets assets/stylesheets")
    # create a "manifest" file at `your_project/assets/application.css` to list out your stylesheets names in their desired load order
    # create a rake task to read through `application.css`
    # then concatentate and "minify" (strip out all white space and line breaks)
    # all the css files into one large `styles.css` file in `public`
  end

  task :create_assets do
    sh("mkdir assets")
  end

 desc "delete Stylesheets"
  task :delete_stylesheets => :move_stylesheets do
    # move all stylesheets out of `public` and into `your_project/assets/stylesheets`
    sh("rm -rf public/stylesheets")
    # create a "manifest" file at `your_project/assets/application.css` to list out your stylesheets names in their desired load order
    # create a rake task to read through `application.css`
    # then concatentate and "minify" (strip out all white space and line breaks)
    # all the css files into one large `styles.css` file in `public`
  end

 desc "delete Stylesheets"
  task :view_stylesheets do
    # create a "manifest" file at `your_project/assets/application.css` to list out your stylesheets names in their desired load order
    touch("assets/stylesheets/manifest")

    # create a rake task to read through `application.css`
    # then concatentate and "minify" (strip out all white space and line breaks)
    # all the css files into one large `styles.css` file in `public`
  end



end

namespace :bundler do
  task :setup do
    require 'rubygems'
    require 'bundler'
  end
end

task :environment, [:env] => 'bundler:setup' do |cmd, args|
  ENV["RACK_ENV"] = args[:env] || "development"
  Bundler.require(:default, ENV["RACK_ENV"])
  require "./config/boot"
end

namespace :db do
  desc "creates a db"
  task :create, [:env] do |cmd, args|
    env = args[:env] || "development"
    dbname = "dvr_app"
    sh("createdb #{dbname}_#{env}")
  end

  desc "drop db"
  task :drop, [:env] do |cmd, args|
    env = args[:env] || "development"
    dbname = "dvr_app"
    sh("dropdb #{dbname}_#{env}")
  end

  desc "seed db"
  task :seed, [:env] do |cmd, args|
    # default environment
    env = args[:env] || "development"
    # load up my sinatra environment
    # then populate my database
    # calls rake environment[env]
    Rake::Task['environment'].invoke(env)
    require './db/seeds'
  end
end

