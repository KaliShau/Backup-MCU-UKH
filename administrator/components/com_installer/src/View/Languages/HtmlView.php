<?php

/**
 * @package     Joomla.Administrator
 * @subpackage  com_installer
 *
 * @copyright   (C) 2012 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace Joomla\Component\Installer\Administrator\View\Languages;

use Joomla\CMS\Access\Exception\NotAllowed;
use Joomla\CMS\Helper\ContentHelper;
use Joomla\CMS\Language\LanguageHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\View\GenericDataException;
use Joomla\Component\Installer\Administrator\Model\LanguagesModel;
use Joomla\Component\Installer\Administrator\View\Installer\HtmlView as InstallerViewDefault;

// phpcs:disable PSR1.Files.SideEffects
\defined('_JEXEC') or die;
// phpcs:enable PSR1.Files.SideEffects

/**
 * Extension Manager Language Install View
 *
 * @since  2.5.7
 */
class HtmlView extends InstallerViewDefault
{
    /**
     * @var object item list
     */
    protected $items;

    /**
     * @var object pagination information
     */
    protected $pagination;

    /**
     * Form object for search filters
     *
     * @var  \Joomla\CMS\Form\Form
     */
    public $filterForm;

    /**
     * The active search filters
     *
     * @var  array
     */
    public $activeFilters;

    /**
     * Display the view.
     *
     * @param   string  $tpl  template to display
     *
     * @return  void
     */
    public function display($tpl = null)
    {
        if (!$this->getCurrentUser()->authorise('core.admin')) {
            throw new NotAllowed(Text::_('JERROR_ALERTNOAUTHOR'), 403);
        }

        /** @var LanguagesModel $model */
        $model = $this->getModel();

        // Get data from the model.
        $this->items         = $model->getItems();
        $this->pagination    = $model->getPagination();
        $this->filterForm    = $model->getFilterForm();
        $this->activeFilters = $model->getActiveFilters();
        $this->installedLang = LanguageHelper::getInstalledLanguages();

        // Check for errors.
        if (\count($errors = $model->getErrors())) {
            throw new GenericDataException(implode("\n", $errors), 500);
        }

        parent::display($tpl);
    }

    /**
     * Add the page title and toolbar.
     *
     * @return void
     */
    protected function addToolbar()
    {
        $canDo   = ContentHelper::getActions('com_languages');
        $toolbar = $this->getDocument()->getToolbar();

        if ($canDo->get('core.manage')) {
            $toolbar->linkButton('list', 'COM_INSTALLER_TOOLBAR_MANAGE_LANGUAGES')
                ->url('index.php?option=com_languages&view=installed');
            $toolbar->linkButton('comments', 'COM_INSTALLER_TOOLBAR_MANAGE_LANGUAGES_CONTENT')
                ->url('index.php?option=com_languages&view=languages');
            $toolbar->divider();
        }

        parent::addToolbar();

        $toolbar->help('Extensions:_Languages');
    }
}
