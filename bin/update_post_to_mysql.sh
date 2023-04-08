#!/usr/bin/env bash
set -euxo pipefail
cd $(dirname $0)/..

CMDNAME=$(basename $0)
CONTAINER=wp-kuroneko-db

while getopts t: OPT
do
	case ${OPT} in
		"t" ) FLG_T="TRUE" ; VALUE_T="${OPTARG}";;
			* ) echo "Usage: ${CMDNAME} [-t posts_id]" 1>&2
			exit 1;;
	esac
done

if [ "${FLG_T}" = "TRUE" ]; then
	SQL_FILE=$(pwd)/mysql/outputs/${VALUE_T}.sql
	docker exec ${CONTAINER} sh -c "mysql -h ${MYSQL_HOST} -D ${MYSQL_DATABASE} -u ${MYSQL_USER} -p${MYSQL_PASSWORD}" < ${SQL_FILE}
fi


exit 0
