#!/usr/bin/env bash

if [ -f ~/.drush/sda-host-test.aliases.drushrc.php ]; then
  echo "Making backup of current Drush aliases into ~/.drush/...bak."
  cp ~/.drush/sda-host-test.aliases.drushrc.php ~/.drush/sda-host-test.aliases.drushrc.php.bak
fi

echo "Copying Drush aliases into ~/.drush."
cp -f ./sda-host-test.aliases.drushrc.php ~/.drush
