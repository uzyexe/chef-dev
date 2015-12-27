task :default => "run:osx"

desc "Install rubygems and third-paty Chef cookbooks"
task :init => [:bundle, :berks]

desc "Install rubygems"
task :bundle do
  sh "gem install bundler"
  sh "bundle --path vendor/bundle --binstubs .bundle/bin"
end

desc "Install third-paty Chef cookbooks"
task :berks do
  sh ".bundle/bin/berks vendor cookbooks"
end

namespace :run do
  desc "Run at OSX environment"
  task :osx do
    sh "chef-solo -c config/solo.rb -j nodes/osx.json"
    # Fix: Installing adobe-reader in brew-cask fails
    # https://github.com/caskroom/homebrew-cask/issues/6332
    sh "[ `brew cask list | grep -w adobe-reader || echo 'missing'` == 'adobe-reader' ] &&
      # True: Reinstall the Adobe Reader
      brew cask uninstall --force adobe-reader && brew cask install --force adobe-reader ||
      # False: Install the Adobe Reader
      brew cask install --force adobe-reader"
  end

  desc "Run at Linux environment"
  task :linux do
    sh "chef-solo -c config/solo.rb -j nodes/linux.json"
  end
end

namespace :cookbook do
  desc "Generate cookbook at site-cookbooks; (ex: rake cookbook:create name=helloworld)"
  task :create do
    name = ENV["name"]
    sh "knife cookbook create #{name} -o site-cookbooks"
  end

  desc "Validate cookbooks at sitte-cookbooks"
  task :validate do
    sh "foodcritic site-cookbooks"
  end
end
