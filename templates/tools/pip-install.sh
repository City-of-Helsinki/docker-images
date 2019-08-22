#!/usr/bin/env bash

usage() { echo "Usage: $0 [-p <path>] -c <command>" 1>&2; exit 1; }

while getopts ":p::c:" o; do
    case "${o}" in
        p)
            p=${OPTARG}
            ;;
        c)
            c=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done

if [ -z "${c}" ]; then
    usage
fi

path_command=""
if [ ! -z "${p}" ]; then
    path_command="cd ${p} &&"
fi

su - appuser -c "${path_command} pip install --user --no-cache-dir ${c}"

