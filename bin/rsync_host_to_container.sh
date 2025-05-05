#!/usr/bin/env bash
# set x # for debug
set -euo pipefail
cd $(dirname $0)/..

CMDNAME=$(basename $0)
CONTAINER="wp-kuroneko"
SRC=$(pwd)/wp/wp-content
DEST="${CONTAINER}:/var/www/html/wp-content"
EXCLUDE="$(pwd)/etc/exclude-file.txt"

usage() {
	echo "Usage: ${CMDNAME} [-t, --target all|themes|uploads|plugins] [-d, --delete true|false] delete files in container" 1>&2
	exit 1
}

while getopts t:d:h OPT
do
	case "${OPT}" in
		"t" | "target" )
			FLG_T="TRUE"
			VALUE_T="${OPTARG}"
		;;
		"d" | "delete" )
			FLG_D="TRUE"
			VALUE_D="${OPTARG}"
		;;
		"h" ) usage;;
		\? ) usage;;
	esac
done

# Error handling
if [ "${FLG_T:-}" = "" ]; then
	echo "No target specified. Please use -t or --target to specify a target."
	usage
	exit 1
fi

# Handle delete option
if [ "${FLG_D:-}" = "" ]; then
	FLG_D="FALSE"
	VALUE_D="FALSE"
fi

if [ "${FLG_T}" = "TRUE" ]; then
	case "${VALUE_T}" in
		"all" )
			if [ "${FLG_D}" = "TRUE" ] && [ "${VALUE_D}" = "TRUE" ]; then
				# See rsync options: https://qiita.com/mamemomonga/items/b5f765e3adc902f5e28d#%E4%BE%8B
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --delete --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --delete --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --delete --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
			else
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
			fi
		;;
		"themes" )
			if [ "${FLG_D}" = "TRUE" ] && [ "${VALUE_D}" = "TRUE" ]; then
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --delete --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
			else
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
			fi
		;;
		"uploads" )
			if [ "${FLG_D}" = "TRUE" ] && [ "${VALUE_D}" = "TRUE" ]; then
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --delete --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
			else
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
			fi
		;;
		"plugins" )
			if [ "${FLG_D}" = "TRUE" ] && [ "${VALUE_D}" = "TRUE" ]; then
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --delete --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
			else
				rsync --blocking-io -e 'docker exec -i' -rltDhv --no-perms -O --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
			fi
		;;
		*)
			echo "Invalid target: ${VALUE_T}"
			usage
			exit 1
		;;
	esac
fi

exit 0
