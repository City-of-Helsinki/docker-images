#!/bin/bash
# Derived from https://github.com/docker-library/postgres/blob/master/update.sh
set -x

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */Dockerfile )
fi
versions=( "${versions[@]%/Dockerfile}" )
for version in "${versions[@]}"; do
	IFS=- read pg_major postgis_major <<< "$version"
	echo $postgis_major
	echo $pg_major
    # Remove dereferences from the output (no parameter to get those out at ls-remote)
    git ls-remote --tags https://github.com/postgis/postgis.git 'refs/tags/$postgis_major.*' | grep -v '\^{}'
    test="$(git ls-remote --tags https://github.com/postgis/postgis.git 'refs/tags/$postgis_major.*' | grep -v '\^{}')"
    echo $test

    fullVersion="$(git ls-remote --tags https://github.com/postgis/postgis.git "refs/tags/$postgis_major.*" | grep -v '\^{}' | tail -n1 | sed 's%.*refs/tags/%%')"

	[ -z "$fullVersion" ] && { echo >&2 "Unable to find package for PostGIS $postgis_major on Postgres $pg_major"; exit 1; }

	srcVersion="${fullVersion%%+*}"
	srcSha256="$(curl -sSL "https://github.com/postgis/postgis/archive/$srcVersion.tar.gz" | sha256sum | awk '{ print $1 }')"

    set -x
    cp Dockerfile.alpine.template initdb-postgis.sh update-postgis.sh "$version/"
    mv "$version/$variant/Dockerfile.alpine.template" "$version/Dockerfile"
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' -e 's/%%PG_MAJOR%%/'"$pg_major"'/g; s/%%POSTGIS_VERSION%%/'"$srcVersion"'/g; s/%%POSTGIS_SHA256%%/'"$srcSha256"'/g' "$version/Dockerfile"
    else
        sed -i 's/%%PG_MAJOR%%/'"$pg_major"'/g; s/%%POSTGIS_VERSION%%/'"$srcVersion"'/g; s/%%POSTGIS_SHA256%%/'"$srcSha256"'/g' "$version/Dockerfile"
    fi
done
