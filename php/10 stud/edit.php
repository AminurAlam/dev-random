<?php
if (isset($_POST['submit'])) {
    $pdo = new PDO('sqlite:students.sqlite');
    $stmt = $pdo->query('UPDATE students SET name = '
        . $_POST['name'] . ' WHERE roll = ' . $_POST['roll']);
    echo 'Student details updated successfully.';
}
?>
<html><body>
<form method="POST">
    Roll Number of Student to Edit: <input type="number" name="roll" required><br><br>
    New Name: <input type="text" name="name" required><br><br>
    <input type="submit" name="submit" value="UPDATE">
</form>
</body></html>
