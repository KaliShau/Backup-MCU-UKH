<?php

/**
 * @package     Joomla.Administrator
 * @subpackage  com_media
 *
 * @copyright   (C) 2017 Open Source Matters, Inc. <https://www.joomla.org>
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

namespace Joomla\Component\Media\Administrator\View\File;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\View\HtmlView as BaseHtmlView;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\Component\Media\Administrator\Model\FileModel;

// phpcs:disable PSR1.Files.SideEffects
\defined('_JEXEC') or die;
// phpcs:enable PSR1.Files.SideEffects

/**
 * View to edit a file.
 *
 * @since  4.0.0
 */
class HtmlView extends BaseHtmlView
{
    /**
     * Execute and display a template script.
     *
     * @param   string  $tpl  The name of the template file to parse; automatically searches through the template paths.
     *
     * @return  void
     *
     * @since   4.0.0
     */
    public function display($tpl = null)
    {
        /** @var FileModel $model */
        $model = $this->getModel();

        $input = Factory::getApplication()->getInput();

        $this->form = $model->getForm();

        // The component params
        $this->params = ComponentHelper::getParams('com_media');

        // The requested file
        $this->file = $model->getFileInformation($input->getString('path', null));

        if (empty($this->file->content)) {
            // @todo error handling controller redirect files
            throw new \Exception(Text::_('COM_MEDIA_ERROR_NO_CONTENT_AVAILABLE'));
        }

        $this->addToolbar();

        parent::display($tpl);
    }

    /**
     * Add the toolbar buttons
     *
     * @return  void
     *
     * @since   4.0.0
     */
    protected function addToolbar()
    {
        ToolbarHelper::title(Text::_('COM_MEDIA_EDIT'), 'images mediamanager');

        $toolbar = $this->getDocument()->getToolbar();
        $toolbar->apply('apply');
        $toolbar->save('save');
        $toolbar->standardButton('reset', 'COM_MEDIA_RESET', 'reset')
            ->icon('icon-refresh')
            ->listCheck(false);

        $toolbar->cancel('cancel');
    }
}
