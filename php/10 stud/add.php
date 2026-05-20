<?php
if (isset($_POST['submit'])) {
    $pdo = new PDO('sqlite:students.sqlite');
    $stmt = $pdo->query('INSERT INTO students (roll, name) VALUES ('
        . $_POST['roll'] . ', ' . $_POST['name'] . ')');
    echo 'Student added successfully.';
}
?>
<html><body>
<form method="POST">
    Roll Number: <input type="number" name="roll" required><br><br>
    Name: <input type="text" name="name" required><br><br>
    <input type="submit" name="submit" value="ADD STUDENT">
</form>
</body></html>
