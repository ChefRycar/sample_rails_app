#!/bin/bash
set -u

BUILD_START=$(date +%s)
STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo install | sum | cut -f 1 -d \ )
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

./buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START install


STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo testing | sum | cut -f 1 -d \ )

bundle exec rake db:migrate
bundle exec rails test
bundle exec rspec .

./buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START testing