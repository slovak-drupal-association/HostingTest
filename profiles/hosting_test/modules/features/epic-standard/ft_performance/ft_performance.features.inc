<?php
/**
 * @file
 * ft_performance.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function ft_performance_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
