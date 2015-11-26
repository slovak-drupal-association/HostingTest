<?php
/**
 * @file
 * Local Drush aliases for SDA Hosting Test projects.
 *
 * Created by PhpStorm.
 * User: davidlukac
 * Date: 04/11/15
 * Time: 19:03
 *
 * Copy this file into your `~/.drush` folder (a copy script is supplied).
 * Other scripts assume that Drush aliases are available for them, when running
 * locally (but not on VM).
 */

/**
 * List of available aliases:
 * - @hosttest.local
 */

$aliases['hosttest.local'] = array(
  // The parent alias might require a change, depending on how the local site is
  // named.
  'parent' => '@loc.sda-host-test',
);
