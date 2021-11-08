#!/bin/bash
set -u

BUILD_START=$(date +%s)
STEP_START=$(date +%s)
STEP_SPAN_ID=$(echo ohai | sum | cut -f 1 -d \ )

echo "Ohai!"

./buildevents step $BUILDKITE_BUILD_ID $STEP_SPAN_ID $STEP_START ohai