<?php
setcookie("last", date("Y-m-d H:i:s"), time() + (86400 * 3), "/");
?>

<html>
    <body>
        <?= $_COOKIE["last"] ?: "first visit" ?>
    </body>
</html>
