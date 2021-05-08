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
    <title>Read Post</title>
    <!--Stylesheet file-->
    <link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
    <div style="text-align: center; margin-top: 0;">
        <h1 style="textalign: center;">It's read post page!</h1>
    </div>

    <?php
        $uid = $_SESSION["id"];

        $sql = "SELECT post FROM user_post WHERE uid = '$uid'";
        $res = $db->query($sql);

        if($res->num_rows > 0) {
            $row = $res->fetch_assoc();

            $post = $row["post"];

        }
    ?>

    <?php if(!empty($post)) { ?>
        <div id="read">
            <p> <?php echo $post; ?> </p>
        </div>
    <?php } ?>
</body>
</html>