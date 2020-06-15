<?php
include_once 'includes/config.php';

$config = new Config();
$db = $config->getConnection();

if($_POST){
	
	include_once 'includes/login.inc.php';
	$login = new Login($db);

	$login->userid = $_POST['username'];
	$login->passid = md5($_POST['password']);
	
	if($login->login()){
		echo "<script>location.href='index.php'</script>";
	}
	
	else{
		echo "<script>alert('Gagal Total')</script>";
	}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Metode SAW</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-4">&nbsp;</div>
			<div class="col-xs-12 col-sm-4 col-md-5">

				<div style="margin-top: 100px;" class="panel panel-primary"><div class="panel-body">
				<div class="text-center">
					<img src="images/dpag.png" alt="" width="100" hight="100">	

					<p>Sistem Pendukung Keputusan Penentuan Madrasah Tsanawiah (Mts) 
						Terbaik Di Lampung Utara Menggunakan Metode Siple Additive Weighting (SAW)
						Berbasis Web
					</p>
				</div>
			
					
					<form method="post">
						<div class="form-group">				    
							<input type="text" class="form-control" name="username"  id="InputUsername1" placeholder="Username">
						</div>
						<div class="form-group">				    
							<input type="password" class="form-control" name="password" id="InputPassword1" placeholder="Password">
						</div>
						<?php  ?>
						<button type="submit" class="btn btn-success col-md-12">Login</button>
					</form>
				</div></div>

			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-1.11.3.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>