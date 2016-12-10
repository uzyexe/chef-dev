task :default => "run:osx"

desc "Install rubygems and third-paty Chef cookbooks"
task :init => [:bundle, :setup, :berks]

desc "Install rubygems"
task :bundle do
  # Setup the anyenv
  sh "ls -al ${HOME}/.anyenv || git clone https://github.com/riywo/anyenv ${HOME}/.anyenv"
  sh "if [ ! -e ${HOME}/.bash_profile ] ; then echo 'if [ -f ~/.bashrc ] ; then . ~/.bashrc; fi' > ${HOME}/.bash_profile; fi"
  sh "if [ ! -d ${HOME}/.anyenv/plugins ] ; then mkdir ${HOME}/.anyenv/plugins; fi"
  sh "if [ ! -d ${HOME}/.anyenv/plugins/anyenv-update ]; then git clone https://github.com/znz/anyenv-update.git ${HOME}/.anyenv/plugins/anyenv-update; fi"
  sh "export PATH=\"${HOME}/.anyenv/bin:$PATH\""
  sh "grep -w '${HOME}/.anyenv/bin' ~/.bashrc || echo 'export PATH=\"${HOME}/.anyenv/bin:$PATH\"' >> ~/.bashrc"
  sh "eval \"$(${HOME}/.anyenv/bin/anyenv init -)\""
  sh "grep -w 'anyenv init -' ~/.bashrc || echo 'eval \"$(anyenv init -)\"' >> ~/.bashrc"
  sh "${HOME}/.anyenv/bin/anyenv envs | grep -w rbenv || ${HOME}/.anyenv/bin/anyenv install rbenv"
  sh "${HOME}/.anyenv/bin/anyenv envs | grep -w plenv || ${HOME}/.anyenv/bin/anyenv install plenv"
  sh "${HOME}/.anyenv/bin/anyenv envs | grep -w pyenv || ${HOME}/.anyenv/bin/anyenv install pyenv"
  sh "${HOME}/.anyenv/bin/anyenv envs | grep -w ndenv || ${HOME}/.anyenv/bin/anyenv install ndenv"
  sh "${HOME}/.anyenv/bin/anyenv envs | grep -w goenv || ${HOME}/.anyenv/bin/anyenv install goenv"
  sh "chown -R ${USER} ${HOME}/.anyenv"
  sh "echo ${PATH} | grep -w anyenv || exec ${SHELL} -l && echo 'Please retry `rake init`'"
end

desc "Setup Ruby Gems"
task :setup do
  sh "if [ ! -d ~/.anyenv/envs/rbenv/versions/$(cat .ruby-version) ]; then rbenv install $(cat .ruby-version); fi"
  sh "export PATH=\"$(gem env | grep EXECUTABLE.*bin$ | awk '{print $4}' | sed s/[[:space:]]//):$PATH\""
  sh "grep -w 'EXECUTABLE' ~/.bashrc || echo 'export PATH=\"$(gem env | grep EXECUTABLE.*bin$ | cut -d: -f2 | sed s/[[:space:]]//):$PATH\"' >> ~/.bashrc"
  sh "export PATH=\"$(gem env | grep USER | grep .gem/ruby | awk '{print $5}' | sed s/[[:space:]]//)/bin:$PATH\""
  sh "grep -w 'USER' ~/.bashrc || echo 'export PATH=\"$(gem env | grep USER | grep .gem/ruby | cut -d: -f2| sed s/[[:space:]]//)/bin:$PATH\"' >> ~/.bashrc"
  sh "echo 'Please reload your profile (exec $SHELL -l) or open a new session.'", verbose: false
  sh "gem install bundler"
  sh "bundle install --path vendor/bundle"
end

desc "Install third-paty Chef cookbooks"
task :berks do
  sh "bundle ex berks vendor cookbooks"
  sh "echo 'Finish!'", verbose: false
  sh "echo 'Try `sudo chef-solo -c config/solo.rb -j nodes/osx.json`'", verbose: false
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
