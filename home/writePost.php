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
    <title>Write Post</title>
    <!--Stylesheet file-->
    <link type="text/css" rel="stylesheet" href="css/style.css">

    <!--Include CKEditor library-->
    <script src="ckeditor/ckeditor.js"></script>
</head>
<body>
    
        <?php
            $editorContent = $statusMsg = '';

            $uid = $_SESSION["id"];
            $uname = $_SESSION["name"];

            // If the form is submitted
            if(isset($_POST['submit'])){
                // Get editor content
                $editorContent = $_POST['editor'];

                

                $editedContent =  strip_tags($editorContent, '');

                $editedContent = preg_replace("/\s|&nbsp;/",' ',$editedContent);
                
                // Check whether the editor content is empty
                if(!empty($editorContent)){
                    // Insert editor content in the database
                    $insert = $db->query("INSERT INTO user_post (uid, post, created) VALUES ('$uid', '".$editedContent."', NOW())");
                    
                    // If database insertion is successful
                    if($insert){
                        $statusMsg = "The editor content has been inserted successfully.";
                       
                    }else{
                        $statusMsg = "Some problem occurred, please try again.";
                    } 
                }else{
                    $statusMsg = 'Please add content in the editor.';
                }
            }

        ?>

        <div>
            <h3><?php echo $statusMsg; ?></h3>
        </div>

        <div id="CKEditor">
            <!--Editor content submission form-->
            <form method="post" action="<?php echo $_SERVER["PHP_SELF"]; ?>">
                <textarea name="editor" id="editor" placeholder="Type here..."></textarea>
            <input id="btnSubmit" type="submit" name="submit" value="SUBMIT">
            </form>
        </div>

        </div>
        <!--Add CKEditor to textarea-->
        <script>
            CKEDITOR.replace('editor');
        </script>



</body>
</html>