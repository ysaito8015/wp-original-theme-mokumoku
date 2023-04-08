#!/usr/bin/env bash
set -euxo pipefail
cd $(dirname $0)/..

CMDNAME=$(basename $0)
CONTAINER_NAME="wp-kuroneko"
SRC="${CONTAINER_NAME}:/var/www/html/wp-content"
DEST=$(pwd)/wp/wp-content
EXCLUDE="$(pwd)/etc/exclude-file.txt"

while getopts t: OPT
do
	case ${OPT} in
		"t" ) FLG_T="TRUE" ; VALUE_T="${OPTARG}";;
			* ) echo "Usage: ${CMDNAME} [-t all|theme|uploads|plugins]" 1>&2
			exit 1;;
	esac
done

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "all" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/themes/res ${DEST}/themes/
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
fi

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "theme" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/themes/res ${DEST}/themes/
fi

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "uploads" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
fi

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "plugins" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
fi


exit 0
