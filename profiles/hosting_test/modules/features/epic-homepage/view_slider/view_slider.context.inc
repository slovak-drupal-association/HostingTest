<?php
/**
 * @file
 * view_slider.context.inc
 */

/**
 * Implements hook_context_default_contexts().
 */
function view_slider_context_default_contexts() {
  $export = array();

  $context = new stdClass();
  $context->disabled = FALSE; /* Edit this to true to make a default context disabled initially */
  $context->api_version = 3;
  $context->name = 'home';
  $context->description = '';
  $context->tag = '';
  $context->conditions = array(
    'path' => array(
      'values' => array(
        '<front>' => '<front>',
      ),
    ),
  );
  $context->reactions = array(
    'block' => array(
      'blocks' => array(
        'views-slider-block' => array(
          'module' => 'views',
          'delta' => 'slider-block',
          'region' => 'content',
          'weight' => '-10',
        ),
        'views-latest_forum_comments-block' => array(
          'module' => 'views',
          'delta' => 'latest_forum_comments-block',
          'region' => 'triptych_middle',
          'weight' => '-10',
        ),
      ),
    ),
  );
  $context->condition_mode = 0;
  $export['home'] = $context;

  return $export;
}
