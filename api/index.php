<?php

/**
 * @package    Joomla.API
 *
 * @copyright  (C) 2019 Open Source Matters, Inc. <https://www.joomla.org>
 * @license    GNU General Public License version 2 or later; see LICENSE.txt
 */

// NOTE: This file should remain compatible with PHP 5.2 to allow us to run our PHP minimum check and show a friendly error message

// Define the application's minimum supported PHP version as a constant so it can be referenced within the application.
\define('JOOMLA_MINIMUM_PHP', '8.1.0');

if (version_compare(PHP_VERSION, JOOMLA_MINIMUM_PHP, '<')) {
    header('HTTP/1.1 500 Internal Server Error');
    echo json_encode(
        ['error' => \sprintf('Joomla requires PHP version %s to run', JOOMLA_MINIMUM_PHP)]
    );

    return;
}

/**
 * Constant that is checked in included files to prevent direct access.
 * define() is used rather than "const" to not cause an error for PHP 5.2 and lower
 */
\define('_JEXEC', 1);

// Run the application - All executable code should be triggered through this file
require_once __DIR__ . '/includes/app.php';
