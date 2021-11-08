#!/bin/bash
set -u

BUILD_START=$(date +%s)
STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo ohai | sum | cut -f 1 -d \ )

echo "Ohai!"

./scripts/ci/buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START ohai

STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo nite-nite | sum | cut -f 1 -d \ )

echo "Yaaaaaawn"

sleep 10

echo "I'm up!"

./scripts/ci/buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START nite-nite
