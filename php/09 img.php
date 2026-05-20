<?php
if (isset($_POST['upload'])) {
    $f = $_FILES['file'];
    echo move_uploaded_file($f['tmp_name'], $f['name'])
        ? '<h3>Uploaded!</h3>'
        : '<h3>Failed!</h3>';
}
?>

<html><body>
    <form method="POST" action="" enctype="multipart/form-data">
        <input type="file" name="file" value="" />
        <button type="submit" name="upload">UPLOAD</button>
    </form>

    <?php
    $imgs = glob('*.{jpg,jpeg,png}', GLOB_BRACE);

    foreach ($imgs as $img)
        echo "<img src='" . htmlspecialchars($img) . "' width='200px'><br>";
    ?>
</body></html>
