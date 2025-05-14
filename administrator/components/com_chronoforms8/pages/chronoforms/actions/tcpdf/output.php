<?php
/**
* ChronoForms 8
* Copyright (c) 2023 ChronoEngine.com, All rights reserved.
* Author: (ChronoEngine.com Team)
* license:     GNU General Public License version 2 or later; see LICENSE.txt
* Visit http://www.ChronoEngine.com for regular updates and information.
**/
defined('_JEXEC') or die('Restricted access');
?>
<?php
$action['file_name'] = basename(CF8::parse($action['file_path']));

$output = CF8::parse(Chrono::getVal($action, 'content', ''));
//begin tcpdf code
if(file_exists($this->path.DS.'libs/tcpdf/tcpdf.php')){
	require_once($this->path.DS.'libs/tcpdf/config/lang/eng.php');
	require_once($this->path.DS.'libs/tcpdf/tcpdf.php');
}else{
	echo 'TCPDF lib not found, you can download the TCPDF lib here: <a target="_blank" href="https://www.chronoengine.com/downloads/chronoforms/chronoforms-v8/">Chronoforms v8 downloads</a>';
	return;
}

// create new PDF document
if(isset($action["header_html"])){
	class MYPDF extends TCPDF {
		public $header_html = "";
		public $footer_html = "";
		public function Header() {
			$this->writeHTML($this->header_html);
		}
		public function Footer() {
			$this->writeHTML($this->footer_html);
		}
	}
	$pdf = new \MYPDF(Chrono::getVal($action, 'pdf_page_orientation', 'P'), PDF_UNIT, Chrono::getVal($action, 'pdf_page_format', 'A4'), true, 'UTF-8', false);

	$pdf->header_html = CF8::parse(Chrono::getVal($action, 'header_html', ''));
	$pdf->footer_html = CF8::parse(Chrono::getVal($action, 'footer_html', ''));
}else{
	$pdf = new \TCPDF(Chrono::getVal($action, 'pdf_page_orientation', 'P'), PDF_UNIT, Chrono::getVal($action, 'pdf_page_format', 'A4'), true, 'UTF-8', false);
}

//set protection if enabled
if(!empty(Chrono::getVal($action, 'owner_pass', "")) OR !empty(Chrono::getVal($action, 'user_pass', ""))){
	$owner_pass = (Chrono::getVal($action, 'owner_pass', "") ? Chrono::getVal($action, 'owner_pass', "") : null);
	$perms = (count(Chrono::getVal($action, 'permissions', "")) > 0) ? Chrono::getVal($action, 'permissions', "") : array();
	$pdf->SetProtection($perms, Chrono::getVal($action, 'user_pass', ""), $owner_pass, Chrono::getVal($action, 'sec_mode', ""), $pubkeys=null);
}

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor(CF8::parse(Chrono::getVal($action, 'pdf_author', 'PDF Author.')));

if(Chrono::getVal($action, 'pdf_title')){
	$pdf->SetTitle(CF8::parse(Chrono::getVal($action, 'pdf_title')));
}

$pdf->SetSubject(CF8::parse(Chrono::getVal($action, 'pdf_subject', 'Powered by Chronoforms + TCPDF')));
$pdf->SetKeywords(CF8::parse(Chrono::getVal($action, 'pdf_keywords', 'Chronoforms, PDF Plugin, TCPDF, PDF')));
// set default header data'
if(strlen(Chrono::getVal($action, 'pdf_title')) OR strlen(Chrono::getVal($action, 'pdf_header'))){
	$pdf->SetHeaderData(false, 0, CF8::parse(Chrono::getVal($action, 'pdf_title', '')), CF8::parse(Chrono::getVal($action, 'pdf_header', '')));
}

if(Chrono::getVal($action, 'disable_pdf_header', 0)){
	$pdf->SetPrintHeader(false);
}

if(Chrono::getVal($action, 'disable_pdf_footer', 0)){
	$pdf->SetPrintFooter(false);
}

// set header and footer fonts
$pdf->setHeaderFont(Array(CF8::parse(Chrono::getVal($action, 'pdf_header_font', 'helvetica')), '', (int)CF8::parse(Chrono::getVal($action, 'pdf_header_font_size', 10))));
$pdf->setFooterFont(Array(CF8::parse(Chrono::getVal($action, 'pdf_footer_font', 'helvetica')), '', (int)CF8::parse(Chrono::getVal($action, 'pdf_footer_font_size', 8))));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(CF8::parse(Chrono::getVal($action, 'pdf_monospaced_font', 'courier')));

//set margins
$pdf->SetMargins(CF8::parse(Chrono::getVal($action, 'pdf_margin_left', 15)), CF8::parse(Chrono::getVal($action, 'pdf_margin_top', 27)), CF8::parse(Chrono::getVal($action, 'pdf_margin_right', 15)));
$pdf->SetHeaderMargin(CF8::parse(Chrono::getVal($action, 'pdf_margin_header', 5)));
$pdf->SetFooterMargin(CF8::parse(Chrono::getVal($action, 'pdf_margin_footer', 10)));

//set auto page breaks
$pdf->SetAutoPageBreak(TRUE, CF8::parse(Chrono::getVal($action, 'pdf_margin_bottom', 25)));

//set image scale factor
$pdf->setImageScale(CF8::parse(Chrono::getVal($action, 'pdf_image_scale_ratio', 1.25)));

//set some language-dependent strings
//$pdf->setLanguageArray($l);

// ---------------------------------------------------------

// set font
$pdf->SetFont(CF8::parse(Chrono::getVal($action, 'pdf_body_font', 'courier')), '', (int)CF8::parse(Chrono::getVal($action, 'pdf_body_font_size', 14)));

// add a page
$pdf->AddPage();
// output the HTML content
$pdf->writeHTML($output, true, false, true, false, '');
// reset pointer to the last page
$pdf->lastPage();
//Close and output PDF document
$PDF_file_name = CF8::parse(Chrono::getVal($action, 'file_name', 'empty_name.pdf'));

$PDF_view = Chrono::getVal($action, 'pdf_view', 'I');
if(($PDF_view == 'F') || ($PDF_view == 'FI') || ($PDF_view == 'FD')){
	$PDF_file_path = CF8::parse(Chrono::getVal($action, 'file_path'));
	
	$pdf->Output($PDF_file_path, $PDF_view);
	
	$this->set(CF8::getname($element), ['path' => $PDF_file_path]);
	
	$this->debug[CF8::getname($element)] = ['path' => $PDF_file_path];
}else{
	$pdf->Output($PDF_file_name, $PDF_view);
}
if($PDF_view != 'F'){
	// die();
	
	@flush();
	@ob_flush();
	exit;
}