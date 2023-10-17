<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="JQUERY/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>

<?php  
ob_start();
?>

<div class="page-header" style="color: black">
    <div class="jumbotron">
        Bienvenue dans notre site
    </div>
</div>

<?php  
$content = ob_get_clean();
require_once 'template.php';
?>



</body>
</html>
