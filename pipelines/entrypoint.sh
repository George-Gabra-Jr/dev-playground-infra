#!/bin/bash

# Start BuildKit daemon in the background
buildkitd &

# Start Jenkins
exec /usr/bin/tini -- /usr/local/bin/jenkins.sh
