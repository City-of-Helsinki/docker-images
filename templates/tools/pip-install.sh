#!/usr/bin/env bash


function usage {
    echo "Usage: $0 [-p <path>] [-u <user>] -c <command>"
    echo "  -c      command to run"
    echo "  -p      path to run in"
    echo "  -u      user to run as (forces pip --user flag)"1>&2
    exit 1;
}

while getopts ":p::c:u::" o; do
    case "${o}" in
        p)
            p=${OPTARG}
            ;;
        c)
            c=${OPTARG}
            ;;
        u)
            u=${OPTARG}
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


if [ ! -z "${u}" ]; then
    echo "Running with user"
    su - appuser -c "${path_command} pip install --user --no-cache-dir ${c}"
else
    echo "Running without user"
    bash -c "${path_command} pip install --no-cache-dir ${c}"
fi



