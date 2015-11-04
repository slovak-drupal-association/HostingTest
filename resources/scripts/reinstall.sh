#!/usr/bin/env bash

start_time=`date +%s`

# Get us dir where this script is located.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "$1" ]
then
    echo "ERROR: Please provide valid Drush alias. Exiting..."
    exit 1
fi

install_start_time=`date +%s`

if [ -z "$2" ]
then
  echo "INFO: Starting installation."
  drush ${1} si hosting_test --site-name="Hosting test" --site-mail=info@drupal.sk -y
else
  echo "INFO: Starting installation with provided DB credentials."
  drush ${1} si hosting_test --site-name="Hosting test" --site-mail=info@drupal.sk --db-url=${2} -y
fi

echo "INFO: Installation done, performing clean up."
drush ${1} cc all
drush ${1} cc menu
drush ${1} cron

install_end_time=`date +%s`

echo "INFO: Generating testing content."
${DIR}/generate-content.sh ${1}

end_time=`date +%s`
echo Execution time of installation was `expr ${install_end_time} - ${install_start_time}`s.
echo Execution time of whole process was `expr ${end_time} - ${start_time}`s.
