#!/usr/bin/env bash
set -euxo pipefail
cd $(dirname $0)/..

CMDNAME=$(basename $0)
CONTAINER="wp-kuroneko-db"
OUTPUTS=$(pwd)/mysql/outputs

while getopts t:c OPT
do
	case ${OPT} in
		"t" ) FLG_T="TRUE" ; VALUE_T="${OPTARG}";;
		"c" ) FLG_C="TRUE" ;;
			* ) echo "Usage: ${CMDNAME} [-t posts_id] [-c] only post_content" 1>&2
			exit 1;;
	esac
done

if [ "${FLG_T}" = "TRUE" ] && [ "${FLG_C}" = "TRUE" ]; then
	docker exec ${CONTAINER} sh -c "/bin/echo \"SELECT post_content FROM wp_posts WHERE ID='${VALUE_T}'\" | mysql -u ${MYSQL_USER} -D ${MYSQL_DATABASE} -p${MYSQL_PASSWORD}" > ${OUTPUTS}/${VALUE_T}.txt
else
	docker exec ${CONTAINER} sh -c "/bin/echo \"SELECT * FROM wp_posts WHERE ID='${VALUE_T}'\" | mysql -u ${MYSQL_USER} -D ${MYSQL_DATABASE} -p${MYSQL_PASSWORD}" > ${OUTPUTS}/${VALUE_T}.txt
fi

exit 0
