<html>
    <head><link href="style.css" rel="stylesheet" /></head>
    <body>
    <?php
    if ($_COOKIE['admin'] == 'true') {
        try {
            $pdo = new PDO("sqlite:" . __DIR__ . '/students.sqlite');
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $stmt = $pdo->query('SELECT roll, name FROM students');
            $students = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo "<h2>Student Roster</h2>";

            if (count($students) > 0) {
                echo "<ul>";
                foreach ($students as $student) {
                    echo "<li>" . $student['roll'] . ": " . htmlspecialchars($student['name']) . "</li>";
                }
                echo "</ul>";
            } else {
                echo "<p>No students found in the database.</p>";
            }
        } catch (PDOException $e) {
            echo "Database Error: " . $e->getMessage();
        }
    }
    ?>
    </body>
</html>
