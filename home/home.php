<?php
    include "../database/database.php";
    session_start();
    if(!isset($_SESSION["id"])) {
        header("location: ../login/login.php");
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home</title>
    <!--Stylesheet file-->
    <link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body>
    <div id="container">
        <div id="header">
            <h1>Online Personal Diary</h1>
        </div>

        <div id="navbar">
            <ul>
                <li><a href="diaryHome.php" target="diaryFrame">Diary Home</a></li>
                <li><a href="writePost.php" target="diaryFrame">Write Post</a></li>
                <li><a href="readPost.php" target="diaryFrame">Read Post</a></li>



          
             <li><a href="searchPost.php" target="diaryFrame">Search Post</a></li>
             <li><a href="voicePost.php" target="diaryFrame">Voice Post</a></li>

                <li><a href="../logout/logout.php">Log Out</a></li>
            </ul>
        </div>

        <?php
            $uname = $_SESSION["name"];
        ?>
 
        <div id="profile">
            <h1><?php echo 'Welcome '.$uname; ?></h1>
        </div>

        <div id="ifrm">
            <iframe name="diaryFrame" src="diaryHome.php" frameborder="0"></iframe>
        </div>
    </div>  

    

</body>
</html>