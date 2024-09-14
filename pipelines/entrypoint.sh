#!/bin/bash

# Start BuildKit daemon in the background
buildkitd --root /home/jenkins/.local/share/buildkit &

# Start Jenkins
exec /sbin/tini -- /usr/local/bin/jenkins.sh
