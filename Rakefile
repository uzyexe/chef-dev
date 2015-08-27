
task :default => "run:osx"
task :init => [:bundle, :berks]

desc "Install rubygems"
task :bundle do
  sh "bundle --path vendor/bundle --binstubs .bundle/bin"
end

desc "Install third paty cookbooks"
task :berks do
  sh "berks vendor cookbooks"
end

namespace :run do
  desc "Run at OSX environment"
  task :osx do
    sh "chef-solo -c config/solo.rb -j nodes/osx.json"
  end

  desc "Run at Ubuntu environment"
  task :linux do
    sh "sudo ~/.rbenv/versions/1.9.3-p448/bin/chef-solo -c config/solo.rb -j nodes/ubuntu.json nodes/ubuntu.json"
  end
end

namespace :cookbook do
  desc "Generate cookbook at site-cookbooks; rake cookbook:create name=hello"
  task :create do
    name = ENV["name"]
    sh "knife cookbook create #{name} -o site-cookbooks"
  end

  desc "Validate cookbooks at sitte-cookbooks"
  task :validate do
    sh "foodcritic site-cookbooks"
  end
end

