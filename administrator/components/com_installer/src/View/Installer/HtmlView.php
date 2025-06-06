<?php

/**
 * @package     Joomla.Administrator
 * @subpackage  com_installer
 *
 * @copyright   (C) 2007 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace Joomla\Component\Installer\Administrator\View\Installer;

use Joomla\CMS\Factory;
use Joomla\CMS\Helper\ContentHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\View\HtmlView as BaseHtmlView;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\Component\Installer\Administrator\Model\InstallerModel;

// phpcs:disable PSR1.Files.SideEffects
\defined('_JEXEC') or die;
// phpcs:enable PSR1.Files.SideEffects

/**
 * Extension Manager Default View
 *
 * @since  1.5
 */
class HtmlView extends BaseHtmlView
{
    /**
     * The model state
     *
     * @var   \Joomla\Registry\Registry
     *
     * @since  4.0.0
     */
    public $state;

    /**
     * True if there are extension messages to be displayed
     *
     * @var    boolean
     *
     * @since  4.0.0
     */
    public $showMessage;

    /**
     * Constructor.
     *
     * @param   array  $config  Configuration array
     *
     * @since   1.5
     */
    public function __construct($config = null)
    {
        parent::__construct($config);

        $this->_addPath('template', $this->_basePath . '/tmpl/installer');
        $this->_addPath('template', JPATH_THEMES . '/' . Factory::getApplication()->getTemplate() . '/html/com_installer/installer');
    }

    /**
     * Display the view.
     *
     * @param   string  $tpl  Template
     *
     * @return  void
     *
     * @since   1.5
     */
    public function display($tpl = null)
    {
        /** @var InstallerModel $model */
        $model = $this->getModel();

        // Get data from the model.
        $this->state = $model->getState();

        // Are there messages to display?
        $this->showMessage = false;

        if (\is_object($this->state)) {
            $message1          = $this->state->get('message');
            $message2          = $this->state->get('extension_message');
            $this->showMessage = ($message1 || $message2);
        }

        $this->addToolbar();
        parent::display($tpl);
    }

    /**
     * Add the page title and toolbar.
     *
     * @return  void
     *
     * @since   1.6
     */
    protected function addToolbar()
    {
        $canDo   = ContentHelper::getActions('com_installer');
        $toolbar = $this->getDocument()->getToolbar();

        ToolbarHelper::title(Text::_('COM_INSTALLER_HEADER_' . strtoupper($this->getName())), 'puzzle-piece install');

        if ($canDo->get('core.admin') || $canDo->get('core.options')) {
            $toolbar->preferences('com_installer');
            $toolbar->divider();
        }
    }
}
