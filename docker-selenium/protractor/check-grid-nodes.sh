#!/usr/bin/env bash
# check-grid.sh
# check that the grid has the specified number of nodes.
# specify desired node count as --nodes <COUNT>
set -e

HOST="localhost"
PORT="4444"
NODES=""

# process arguments
while [[ $# -gt 0 ]]
do
    case "$1" in
	--host)
	    HOST=${2:-"localhost"}
	    shift 2
	    ;;
	--port)
	    PORT=${2:-"4444"}
	    shift 2
	    ;;
	--nodes)
	    NODES=${2}
	    shift 2
	    ;;
	*)
	    echoerr "Unknown argument: $1"
	    ;;
    esac
done
curl -sSL http://${HOST}:${PORT}/grid/api/hub | jq -r '.slotCounts.free' | grep "${NODES}" || exit 1
