#!/usr/bin/env bash

start_time=`date +%s`

# Exit on any error.
set -e

if [ -z "$1" ]
then
    echo "ERROR: Please provide valid Drush alias. Exiting..."
    exit 1
fi

# Configurations.
event_type='event'
event_count=50
event_comments=20

# Make sure relevant modules are enabled.
drush ${1} en devel_generate -y

# Starting counting time here - we want to measure only time spent on generating
# the content.
gen_start_time=`date +%s`

echo "INFO: Generating ${event_count} pieces of type '${event_type}' and ${event_comments} comments."
drush ${1} genc ${event_count} ${event_comments} --kill --types=${event_type}

# Ending the countdown here - we want to measure only time spent on generating
# the content.
gen_end_time=`date +%s`

# Clean up.
echo "INFO: Cleaning up..."
drush ${1} dis devel_generate -y
drush ${1} cc all
drush ${1} cron

end_time=`date +%s`
echo ""
echo Execution time of content generation was `expr ${gen_end_time} - ${gen_start_time}`s.
echo Execution time of content generation and related tasks was `expr ${end_time} - ${start_time}`s.
