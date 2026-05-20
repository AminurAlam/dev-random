<html><body>
<ol>
<?php
$pdo = new PDO('sqlite:students.sqlite');
$stmt = $pdo->query('SELECT roll, name FROM students');
$students = $stmt->fetchAll(PDO::FETCH_ASSOC);
foreach ($students as $student)
    echo '<li>' . $student['roll'] . ': ' . $student['name'] . '</li>';
?>
</ol>
</body></html>
