#!/usr/bin/env sh

[[ "$TRACE" ]] && set -x


# Set Docker address accordingly. Kubernetes runner uses localhost.
# Currently no way has been found to figure out which executor we are
# actually on, so we assume that the default is GitLab, and if not then
# we are using the Kubernetes executor.
function set_docker_host() {
    if [[ ! "$DOCKER_ENV_CI_SERVER_HOST" = "gitlab.com" ]]; then
        echo "Setting DOCKER_HOST to tcp://localhost:2375"
        export DOCKER_HOST="tcp://localhost:2375"
    fi
}
