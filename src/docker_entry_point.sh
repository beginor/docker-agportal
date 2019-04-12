#!/bin/bash -e

AGS_HOME=/arcgis/portal
LICENSE_MARK=/arcgis/keycode

if [ ! -e $LICENSE_MARK ]; then
  echo "First start, need to authorize arcgis for portal"
  $AGS_HOME/tools/authorizeSoftware -f $LICENSE_FILE
  echo "Licensed" > $LICENSE_MARK
  echo "software authorized, wait for 3 seconds to start portal"
  /bin/sleep 3
else
  echo "Restart, no need to authorize!"
fi

# a function to start arcgis portal using its startup script.
function start_arcgis_portal {
    $AGS_HOME/startportal.sh
}

# a function to stop arcgis portal using its shutdown script.
function stop_arcgis_portal {
    $AGS_HOME/stopportal.sh
}

# a function that spins, stopping every 1s to check if any arcgis
# processes are running. the loop terminates when no running arcgis
# processesa are found.
function wait_for_exit {
    while pgrep -f $AGS_HOME > /dev/null; do
        /bin/sleep 1
    done
    echo "All ArcGIS portal processes have stopped."
}

# a function that is called whenever a signal is caught requesting that
# the process be terminated. in most cases, this will come from Docker
# as this script will be running as PID 1.
function signal_trap {
    echo "A SIGTERM or SIGINT signal was caught; trying to shut down."
    stop_arcgis_portal
}

# trap termination signals and stop the portal processes. this is
# necessary because Docker will send SIGTERM to the container's
# PID 1 when it tries to stop the container. since Bash doesn't
# pass this along, we have to handle it ourselves.
trap signal_trap SIGTERM SIGINT

# begin the portal startup process.
start_arcgis_portal

echo "Listening for termination signals..."
# loop until all arcgis processes are finished.
wait_for_exit
