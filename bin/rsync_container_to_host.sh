#!/usr/bin/env bash
set -euxo pipefail
cd $(dirname $0)/..

CMDNAME=$(basename $0)
CONTAINER_NAME="wp-kuroneko"
SRC="${CONTAINER_NAME}:/var/www/html/wp-content"
DEST=$(pwd)/wp/wp-content
EXCLUDE="$(pwd)/etc/exclude-file.txt"

usage() {
	echo "Usage: ${CMDNAME} [-t, --target all|theme|uploads|plugins] [-d, --delete true|false] delete files in container" 1>&2
	exit 1
}

while getopts t:d:h OPT
do
	case ${OPT} in
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

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "all" ] && [ "${FLG_D}" = "TRUE" ] && [ "${VALUE_D}" = "TRUE" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
else
	rsync --blocking-io -e 'docker exec -i' -ahv --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
	rsync --blocking-io -e 'docker exec -i' -ahv --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
	rsync --blocking-io -e 'docker exec -i' -ahv --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
fi

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "theme" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/themes
else
	rsync --blocking-io -e 'docker exec -i' -ahv --exclude-from=${EXCLUDE} ${SRC}/themes ${DEST}/
fi

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "uploads" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
else
	rsync --blocking-io -e 'docker exec -i' -ahv --exclude-from=${EXCLUDE} ${SRC}/uploads ${DEST}/
fi

if [ "${FLG_T}" = "TRUE" ] && [ "${VALUE_T}" = "plugins" ]; then
	rsync --blocking-io -e 'docker exec -i' -ahv --delete --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
else
	rsync --blocking-io -e 'docker exec -i' -ahv --exclude-from=${EXCLUDE} ${SRC}/plugins ${DEST}/
fi


exit 0
