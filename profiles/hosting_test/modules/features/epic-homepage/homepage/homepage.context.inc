<?php
/**
 * @file
 * homepage.context.inc
 */

/**
 * Implements hook_context_default_contexts().
 */
function homepage_context_default_contexts() {
  $export = array();

  $context = new stdClass();
  $context->disabled = FALSE; /* Edit this to true to make a default context disabled initially */
  $context->api_version = 3;
  $context->name = 'home';
  $context->description = 'Context applied to the front page / homepage.';
  $context->tag = 'home-front';
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
        'views-latest_news-block_1' => array(
          'module' => 'views',
          'delta' => 'latest_news-block_1',
          'region' => 'triptych_first',
          'weight' => '-10',
        ),
        'views-events_upcoming-block' => array(
          'module' => 'views',
          'delta' => 'events_upcoming-block',
          'region' => 'triptych_middle',
          'weight' => '-10',
        ),
        'views-latest_forum_comments-block' => array(
          'module' => 'views',
          'delta' => 'latest_forum_comments-block',
          'region' => 'triptych_last',
          'weight' => '-10',
        ),
      ),
    ),
  );
  $context->condition_mode = 0;

  // Translatables
  // Included for use with string extractors like potx.
  t('Context applied to the front page / homepage.');
  t('home-front');
  $export['home'] = $context;

  return $export;
}
