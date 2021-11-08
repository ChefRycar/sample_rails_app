#!/bin/bash

set -u

git clone git://github.com/rbenv/rbenv.git ~/.rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Install ruby-build as rbenv plugin
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build


rbenv install 2.4.1 && rbenv global 2.4.1

gem install bundler -v 2.2.17
bundle _2.2.17_ config set --local without 'production'
bundle _2.2.17_ install

# Mac M1 Build Nonsense
echo 'npm install libvips'
npm install libvips
echo 'npm install sharp'
npm install sharp --build-from-source
echo 'npm audit fix'
npm audit fix

echo 'npm install yarn'
npm install yarn

echo 'yarn add'
yarn add jquery@3.5.1 bootstrap@3.4.1
echo 'yarn install'
yarn install

bundle exec rake db:migrate
bundle exec rails test
bundle exec rspec .