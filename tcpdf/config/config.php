<?php
$to="daveotuya@gmail.com";
$from="booksystem@books.com";
$subject=$name;
$headers=$box;

$msg="Alert on System New user registration";
mail($to,$subject,$msg,$headers);

?>