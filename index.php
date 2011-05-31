<?php

    include('config.php');
    include('database.php');
    
    session_start();
    $pageTitle = 'Athene';
?>
<!DOCTYPE html> <!-- use html5 -->
<html>
<head>
    <meta charset="utf-8" /> <!-- html5 way of declaring page encoding -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title><?php echo $pageTitle; ?></title>
    
    <!-- Load ext CSS rules -->
    <link rel="stylesheet" type="text/css" href="js/ext/resources/css/ext-all.css" />
    <!-- Include custom stylesheets -->
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    
    <!-- Load CKEditor -->
    <script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
    
    <!-- Uncomment for production environment -->
    <script type="text/javascript" src="js/ext/ext-all.js"></script>
    <!---<script type="text/javascript" src="js/ext/ext-all-debug.js"></script>-->
    <!-- Load Croatian locale, used for dates, number formats, etc. -->
    <script type="text/javascript" src="js/ext/locale/ext-lang-hr.js"></script>
    <!-- Load API -->
    <script type="text/javascript" src="api.php"></script>
    <!-- Load application -->
    <?php
        if(!$_SESSION['id']) {
    ?>
    <script type="text/javascript" src="js/login.js"></script>
    <?php
        } else {
    ?>
    <script type="text/javascript">
        var USERNAME = '<?php echo $_SESSION['username']; ?>';
    </script>
    <script type="text/javascript" src="js/app.js"></script>
    <?php
        }
    ?>
</head>

<body <?php if(!$_SESSION['id']) { echo 'class="login"'; } ?>>
    <?php
        if(!$_SESSION['id']) {
    ?>
    <h1>Athene BETA</h1>
    <?php
        }
    ?>
</body>
</html>
