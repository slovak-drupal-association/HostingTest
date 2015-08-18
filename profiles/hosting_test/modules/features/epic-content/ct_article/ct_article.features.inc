<?php
/**
 * @file
 * ct_article.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function ct_article_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function ct_article_node_info() {
  $items = array(
    'article' => array(
      'name' => t('Article'),
      'base' => 'node_content',
      'description' => '',
      'has_title' => '1',
      'title_label' => t('Title'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}

/**
 * Implements hook_paragraphs_info().
 */
function ct_article_paragraphs_info() {
  $items = array(
    'image_image_paragraph' => array(
      'name' => 'Image+Image Paragraph',
      'bundle' => 'image_image_paragraph',
      'locked' => '1',
    ),
    'image_paragraph' => array(
      'name' => 'Image Paragraph',
      'bundle' => 'image_paragraph',
      'locked' => '1',
    ),
    'text_image_paragraph' => array(
      'name' => 'Text+Image Paragraph',
      'bundle' => 'text_image_paragraph',
      'locked' => '1',
    ),
    'text_paragraph' => array(
      'name' => 'Text Paragraph',
      'bundle' => 'text_paragraph',
      'locked' => '1',
    ),
  );
  return $items;
}
