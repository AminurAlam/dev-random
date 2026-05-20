<?php
if (isset($_POST['submit'])) {
    $pdo = new PDO('sqlite:students.sqlite');
    $stmt = $pdo->query('DELETE FROM students WHERE roll = ' . $_POST['roll']);
    echo 'Student deleted successfully.';
}
?>
<html><body>
<form method="POST">
    Roll No: <input type="number" name="roll" required><br><br>
    <input type="submit" name="submit" value="DELETE">
</form>
</body></html>
