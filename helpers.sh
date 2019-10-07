#!/usr/bin/env sh

[[ "$TRACE" ]] && set -x


function create_image_tag() {
    image_tag="${1}"
    if [[ ! "$CI_COMMIT_REF_NAME" = "master" ]]; then
        image_tag="${image_tag}-${CI_COMMIT_SHA}"
    fi
    echo "🐳 Using image tag: ${image_tag}" >&2
    echo ${image_tag}
}
