 #!/bin/bash

set -u

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