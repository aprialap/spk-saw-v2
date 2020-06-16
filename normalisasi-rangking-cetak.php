<?php
require('includes/fpdf/fpdf.php');

class PDF extends FPDF{
	
	function PDF($orientation='P', $unit='mm', $size='A4'){
	    $this->FPDF($orientation,$unit,$size);
	}
	
	function Header(){
	    $this->SetFont('Times','B',14);
	    $this->Cell(80);
	    $this->Cell(30,10,'Normalisasi R Perangkingan',0,0,'C');
	    $this->Ln(20);
	}
	
	function Footer(){
	    $this->SetY(-15);
	    $this->SetFont('Times','',8);
	    $this->Cell(0,10,$this->PageNo(),0,0,'R');
	}
	
}

include "includes/config.php";
session_start();
if(!isset($_SESSION['nama_lengkap'])){
	echo "<script>location.href='index.php'</script>";
}
$config = new Config();
$db = $config->getConnection();

include_once 'includes/alternatif.inc.php';
$pro1 = new Alternatif($db);
$stmt1 = $pro1->readAll();
include_once 'includes/kriteria.inc.php';
$pro2 = new Kriteria($db);
$stmt2 = $pro2->readAll();
include_once 'includes/rangking.inc.php';
$pro = new Rangking($db);
$stmt = $pro->readKhusus();


$pdf = new PDF();
$pdf->AddPage();
$pdf->SetFont('Times','B',9);
$pdf->Cell(25,7,'Alternatif',1,0,'C');
while ($row2 = $stmt2->fetch(PDO::FETCH_ASSOC)){
  
    $pdf->Cell(25,7,$row2['nama_kriteria'],1,0,'C'); 
}
$pdf->Cell(20,7,'Hasil',1,0,'C'); 
$pdf->Cell(20,7,'ket.',1,0,'C'); 
$pdf->ln();
$pdf->SetFont('Times','',7);
while ($row1 = $stmt1->fetch(PDO::FETCH_ASSOC)){
$pdf->Cell(25,7,$row1['nama_alternatif'],1,0,'L'); 

$a= $row1['id_alternatif'];
$stmtr = $pro->readR($a);
while ($rowr = $stmtr->fetch(PDO::FETCH_ASSOC)){
    $b = $rowr['id_kriteria'];
    $tipe = $rowr['tipe_kriteria'];
    $bobot = $rowr['bobot_kriteria'];

    if($tipe=='benefit'){
        $stmtmax = $pro->readMax($b);
        $maxnr = $stmtmax->fetch(PDO::FETCH_ASSOC);
        $nor = $rowr['nilai_rangking']/$maxnr['mnr1'];
        
        $pdf->Cell(25,7, round($nor, 2),1,0,'C'); 
      
    } else{
        $stmtmin = $pro->readMin($b);
        $minnr = $stmtmin->fetch(PDO::FETCH_ASSOC);
        $nor = $minnr['mnr2']/$rowr['nilai_rangking'];
        $pdf->Cell(25,7, round($nor, 2),1,0,'C'); 
      
    }
    $pro->ia = $a;
    $pro->ik = $b;
    $pro->nn2 = $nor;
    $pro->nn3 = $bobot*$nor;
    $pro->normalisasi();
}

$stmthasil = $pro->readHasil($a);
$hasil = $stmthasil->fetch(PDO::FETCH_ASSOC);

$pdf->Cell(20,7, round($hasil['bbn'], 2),1,0,'C'); 
      
$ket = $hasil['bbn'];

							

							if($ket >=90 && $ket <=100 ){
							
                                $pdf->Cell(20,7, "Terbaik 1",1,0,'C'); 
							}

							if($ket >=85 && $ket <=89 ){
								$pdf->Cell(20,7, "Terbaik 2",1,0,'C'); 
							}

							if($ket >=80 && $ket <=84 ){
								$pdf->Cell(20,7, "Terbaik 3",1,0,'C'); 
							}

							if($ket >=65 && $ket <=79 ){
								$pdf->Cell(20,7, "Terbaik 4",1,0,'C'); 
							}

							if($ket >=60 && $ket <=64 ){
								$pdf->Cell(20,7, "Terbaik 5",1,0,'C'); 
							}

							if($ket >=55 && $ket <=59 ){
                                $pdf->Cell(20,7, "Terbaik 6",1,0,'C'); 
							}

							if($ket >=50 && $ket <=54 ){
								$pdf->Cell(20,7, "Terbaik 7",1,0,'C'); 
							}

							if($ket >=45 && $ket <=49 ){
								$pdf->Cell(20,7, "Terbaik 8",1,0,'C'); 
							}

							if($ket >=35 && $ket <=44){
								$pdf->Cell(20,7, "Terbaik 9",1,0,'C'); 
							}

$pro->ia = $a;
$pro->has = $hasil['bbn'];
$pro->hasil();
$pdf->ln();
}
$pdf->Output();
?>