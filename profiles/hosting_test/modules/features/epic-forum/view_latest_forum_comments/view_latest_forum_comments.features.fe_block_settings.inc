<?php
/**
 * @file
 * view_latest_forum_comments.features.fe_block_settings.inc
 */

/**
 * Implements hook_default_fe_block_settings().
 */
function view_latest_forum_comments_default_fe_block_settings() {
  $export = array();

  $export['version'] = '2.0';

  $export['views-latest_forum_comments-block'] = array(
    'cache' => -1,
    'custom' => 0,
    'delta' => 'latest_forum_comments-block',
    'module' => 'views',
    'node_types' => array(),
    'pages' => '<front>',
    'roles' => array(),
    'themes' => array(
      'hosting_theme' => array(
        'region' => 'content',
        'status' => 1,
        'theme' => 'hosting_theme',
        'weight' => 0,
      ),
      'seven' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'seven',
        'weight' => 0,
      ),
      'zurb_foundation' => array(
        'region' => '',
        'status' => 0,
        'theme' => 'zurb_foundation',
        'weight' => 0,
      ),
    ),
    'title' => '',
    'visibility' => 1,
  );

  return $export;
}
