<?php
/**
 * @file
 * ct_event.strongarm.inc
 */

/**
 * Implements hook_strongarm().
 */
function ct_event_strongarm() {
  $export = array();

  $strongarm = new stdClass();
  $strongarm->disabled = FALSE; /* Edit this to true to make a default strongarm disabled initially */
  $strongarm->api_version = 1;
  $strongarm->name = 'content_access_event';
  $strongarm->value = array(
    'view_own' => array(
      0 => 2,
    ),
    'view' => array(
      0 => 2,
    ),
  );
  $export['content_access_event'] = $strongarm;

  return $export;
}
