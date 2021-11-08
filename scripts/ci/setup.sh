#!/bin/bash
set -u

BUILD_START=$(date +%s)
STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo ohai | sum | cut -f 1 -d \ )


./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID say-hi -- echo "Ohai!"
./scripts/ci/buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START ohai

STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo nite-nite | sum | cut -f 1 -d \ )

./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID feeling-sleepy -- echo "Yaaaaaawn"
./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID sleepy-time -- sleep 10
./scripts/ci/buildevents cmd $BUILDKITE_BUILD_ID $STEP_SPAN_ID wakeup-time -- echo "I'm up!"

./scripts/ci/buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START nite-nite

# FINISH IT
./scripts/ci/buildevents build $BUILDKITE_BUILD_ID $BUILD_START success