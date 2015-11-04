#!/usr/bin/env bash

start_time=`date +%s`

if [ -z "$1" ]
then
    echo "ERROR: Please provide valid Drush alias. Exiting..."
    exit 1
fi

read -p "Do you want to keep enabled/enable 'development' module? [Y/n] "  -r

if [[ $REPLY =~ ^[Yy]$ ]]
then
  drush ${1} en views_ui -y
  drush ${1} en context_ui -y
  drush ${1} en diff -y
  drush ${1} en features_diff -y
  drush ${1} en devel -y
  drush ${1} cc all
else
  drush ${1} dis views_ui -y
  drush ${1} pm-uninstall views_ui -y
  drush ${1} dis context_ui -y
  drush ${1} pm-uninstall context_ui -y
  drush ${1} dis features_diff -y
  drush ${1} pm-uninstall features_diff -y
  drush ${1} dis diff -y
  drush ${1} pm-uninstall diff -y
  drush ${1} dis devel -y
  drush ${1} pm-uninstall devel -y
  drush ${1} cc all
fi

end_time=`date +%s`
echo ""
echo Execution time was `expr ${end_time} - ${start_time}`s.
