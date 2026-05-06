<?php
if (isset($_POST['upload'])) {
    echo move_uploaded_file(
        $_FILES["uploadfile"]["tmp_name"],
        "assets/" . $_FILES["uploadfile"]["name"]
    ) ? "<h3>Uploaded!</h3>" : "<h3>Failed!</h3>";
}
?>

<html>
    <body>
        <form method="POST" action="" enctype="multipart/form-data">
            <input type="file" name="uploadfile" value="" />
            <button type="submit" name="upload">UPLOAD</button>
        </form>

        <?php
        $images = glob("assets/" . "*.{jpg,jpeg,png,gif,webp}", GLOB_BRACE);

        foreach ($images as $image) {
            echo "<img src='" . htmlspecialchars($image) . "' width='200px'><br>";
        }
        ?>

    </body>
</html>
