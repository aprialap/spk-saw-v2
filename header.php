<?php
include "includes/config.php";
session_start();
if(!isset($_SESSION['nama_lengkap'])){
	echo "<script>location.href='login.php'</script>";
}
$config = new Config();
$db = $config->getConnection();
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Administrasi</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/dataTables.bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-default navbar-static-top">
	
		<div class="container">		
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><img src="images/dpag.png" alt="" width="50" hight="50"></li>
				<li><a href="index.php">Home</a></li>
				<li><a href="nilai.php">Nilai</a></li>
				<li><a href="kriteria.php">Kriteria</a></li>
				<li><a href="alternatif.php">Alternatif</a></li>
				<li><a href="rangking.php">Rangking</a></li>
				<li><a href="laporan.php">Laporan</a></li>
		  	</ul>
				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="profil.php"><?php echo $_SESSION['nama_lengkap'] ?></a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span> <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="profil.php">Profil</a></li>
							<li><a href="user.php">Manejer Pengguna</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.php">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>

	<div class="container">