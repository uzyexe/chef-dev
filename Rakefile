task :default => "run:osx"

desc "Install rubygems and third-paty Chef cookbooks"
task :init => [:bundle, :berks]

desc "Install rubygems"
task :bundle do
  # Setup the anyenv
  sh "ls -al ${HOME}/.anyenv || git clone https://github.com/riywo/anyenv ${HOME}/.anyenv"
  sh "if [ ! -e ${HOME}/.bash_profile ] ; then echo 'if [ -f ~/.bashrc ] ; then . ~/.bashrc; fi' > ${HOME}/.bash_profile; fi"
  sh "if [ ! -d ${HOME}/.anyenv/plugins ] ; then mkdir ${HOME}/.anyenv/plugins; fi"
  sh "if [ ! -d ${HOME}/.anyenv/plugins/anyenv-update ]; then git clone https://github.com/znz/anyenv-update.git ${HOME}/.anyenv/plugins/anyenv-update; fi"
  sh "export PATH=\"${HOME}/.anyenv/bin:$PATH\""
  sh "grep -w '${HOME}/.anyenv/bin' ~/.bashrc || echo 'export PATH=\"${HOME}/.anyenv/bin:$PATH\"' >> ~/.bashrc"
  sh "eval \"$(anyenv init -)\""
  sh "grep -w 'anyenv init -' ~/.bashrc || echo 'eval \"$(anyenv init -)\"' >> ~/.bashrc"
  sh "anyenv envs | grep -w rbenv || anyenv install rbenv"
  sh "anyenv envs | grep -w plenv || anyenv install plenv"
  sh "anyenv envs | grep -w pyenv || anyenv install pyenv"
  sh "anyenv envs | grep -w ndenv || anyenv install ndenv"
  sh "anyenv envs | grep -w goenv || anyenv install goenv"
  sh "chown -R ${USER} ${HOME}/.anyenv"
  sh "echo 'Please reload your profile (exec $SHELL -l) or open a new session.'"
  sh "gem install --user-install bundler"
  sh "bundle --path vendor/bundle --binstubs .bundle/bin"
end

desc "Install third-paty Chef cookbooks"
task :berks do
  sh ".bundle/bin/berks vendor cookbooks"
end

namespace :run do
  desc "Run at OSX environment"
  task :osx do
    sh "sudo bundle ex chef-solo -c config/solo.rb -j nodes/osx.json"
    sh "sudo chown -R ${USER} /Library/Caches/Homebrew/"

    # Fix: Installing adobe-reader in brew-cask fails
    # https://github.com/caskroom/homebrew-cask/issues/6332
    sh "sudo chown ${USER} ~/Library/Caches/Homebrew/Cask"
    sh "[ `brew cask list | grep -w adobe-reader || echo 'missing'` == 'adobe-reader' ] &&
      # True: Reinstall the Adobe Reader
      brew cask uninstall --force adobe-reader && brew cask install --caskroom=/opt/homebrew-cask/Caskroom --force adobe-reader ||
      # False: Install the Adobe Reader
      brew cask install --caskroom=/opt/homebrew-cask/Caskroom --force adobe-reader"
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

  desc "Validate cookbooks at site-cookbooks"
  task :validate do
    sh "foodcritic site-cookbooks"
  end
end
