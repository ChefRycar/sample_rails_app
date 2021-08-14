 #!/bin/bash

set -eu

gem install bundle

bundle install --without production

# Mac M1 Build Nonsense
npm install libvips
npm install sharp --build-from-source
npm audit fix --force

yarn install

bundle exec rake db:migrate
bundle exec rails test
bundle exec rspec .