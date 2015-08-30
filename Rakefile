task :default => "run:osx"

desc "Install rubygems and third-paty Chef cookbooks."
task :init => [:bundle, :berks]

desc "Install rubygems."
task :bundle do
  sh "bundle --path vendor/bundle --binstubs .bundle/bin"
end

desc "Install third paty Chef cookbooks."
task :berks do
  sh "berks vendor cookbooks"
end

namespace :run do
  desc "Run at OSX environment."
  task :osx do
    sh "chef-solo -c config/solo.rb -j nodes/osx.json"
  end

  desc "Run at Linux environment."
  task :linux do
    sh "sudo chef-solo -c config/solo.rb -j nodes/linux.json"
  end
end

namespace :cookbook do
  desc "Generate cookbook at site-cookbooks. (ex: rake cookbook:create name=helloworld)"
  task :create do
    name = ENV["name"]
    sh "knife cookbook create #{name} -o site-cookbooks"
  end

  desc "Validate cookbooks at sitte-cookbooks."
  task :validate do
    sh "foodcritic site-cookbooks"
  end
end
