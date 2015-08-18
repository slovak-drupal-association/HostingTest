<?php
/**
 * @file
 * field_base.features.inc
 */

/**
 * Implements hook_eck_bundle_info().
 */
function field_base_eck_bundle_info() {
  $items = array(
    'general_general' => array(
      'machine_name' => 'general_general',
      'entity_type' => 'general',
      'name' => 'general',
      'label' => 'General',
    ),
  );
  return $items;
}

/**
 * Implements hook_eck_entity_type_info().
 */
function field_base_eck_entity_type_info() {
  $items = array(
    'general' => array(
      'name' => 'general',
      'label' => 'General',
      'properties' => array(),
    ),
  );
  return $items;
}
