<?php
//============================================================+
// File name   : example_006.php
// Begin       : 2008-03-04
// Last Update : 2013-05-14
//
// Description : Example 006 for TCPDF class
//               WriteHTML and RTL support
//
// Author: Nicola Asuni
//
// (c) Copyright:
//               Nicola Asuni
//               Tecnick.com LTD
//               www.tecnick.com
//               info@tecnick.com
//============================================================+

/**
 * Creates an example PDF TEST document using TCPDF
 * @package com.tecnick.tcpdf
 * @abstract TCPDF - Example: WriteHTML and RTL support
 * @author Nicola Asuni
 * @since 2008-03-04
 */
$connection = mysqli_connect('localhost','root','') or die(mysqli_connect_error());
$database = mysqli_select_db($connection,'slicc car hire') or die(mysqli_connect_error());


// Include the main TCPDF library (search for installation path).
require_once('tcpdf_include.php');

// create new PDF document
$pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

// set document information
$pdf->SetCreator(PDF_CREATOR);
$pdf->SetAuthor('SLICC RENTAL CARS');
$pdf->SetTitle('SLICC RENTAL CARS');
$pdf->SetSubject('CARS REPORT');
$pdf->SetKeywords('TCPDF, PDF, example, test, guide');

// set default header data

$pdf->SetHeaderData('../images/logo.jpg', PDF_HEADER_LOGO_WIDTH, 'SLICC RENTAL CARS', 'By George');

// set header and footer fonts
$pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
$pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

// set default monospaced font
$pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

// set margins
$pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
$pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
$pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

// set auto page breaks
$pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

// set image scale factor
$pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

// set some language-dependent strings (optional)
if (@file_exists(dirname(__FILE__).'/lang/eng.php')) {
	require_once(dirname(__FILE__).'/lang/eng.php');
	$pdf->setLanguageArray($l);
}

// ---------------------------------------------------------
$status = $_POST['status'];

// set font
$pdf->SetFont('times', '', 20);
// add a page
$pdf->AddPage();
$pdf->Write(0, 'CARS REPORT - '.$status.'', '', 0, 'C', true, 0, false, false, 0);
$pdf->Write(0, "", '', 0, 'C', true, 0, false, false, 0);
$pdf->Ln();

// set font
$pdf->SetFont('times', 'BI', 12);
$pdf->Write(0, 'The following is a list of all cars.', '', 0, 'C', true, 0, false, false, 0);

$pdf->Ln();
$pdf->SetFont('times', 'B', 12);

// create some HTML content
$html=<<<EOD
<table cellpadding="2" border="1">
<tr>
<td colspan="1">Type</td>
<td colspan="1">Model</td>
<td colspan="1">Year of Manufacture</td>
<td colspan="1">Registration No.</td>
<td colspan="1">Title</td>
</tr>
</table>
EOD;

$pdf->writeHTML($html, true, false, false, false, '');

$pdf->SetFont('times', '', 12);

$query="SELECT * FROM cars where status='$status' ORDER BY id DESC";

$result=mysqli_query($connection,$query);

$i=1;
$html ="<style>span{font-weight:bold;}table td{text-align:center;padding:5px;border:1px dotted black;}</style><table cellspacing='3' align='center' fontsize='10'>";

while($row=mysqli_fetch_array($result))
{
    $id=$row['id'];
	$type=$row['type'];
	$model=$row['model'];
	$year=$row['year'];
	$regno=$row['regno'];	
	$title=$row['title'];
$html .=<<<EOF

<tr >
<td colspan="1"><span>{$i}</span>. {$id}</td>
<td colspan="1">{$type}</td>
<td colspan="1">{$model}</td>
<td colspan="1">{$year}</td>
<td colspan="1">{$regno}</td>
<td colspan="1">{$title}</td>
</tr>
EOF;
$i++;
}
$html .="</table>";

$pdf->writeHTML($html, true, false, false, false, '');

$pdf->Ln();

$pdf->Ln();
$d=time();

$pdf->write(0,'Date: '.@date('d/m/y'), true, false, false, false, '');
$pdf->Ln();
$pdf->write(0,'Sign:...................................................', true, false, false, false, '');
// ---------------------------------------------------------

//Close and output PDF document
$pdf->Output('report.pdf', 'I');

//============================================================+
// END OF FILE
//============================================================+
