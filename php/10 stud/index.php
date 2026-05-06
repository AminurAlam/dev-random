<?php
if(isset($_POST['submit'])) {
    try {
        $pdo = new PDO("sqlite:" . __DIR__ . '/students.sqlite');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $stmt = $pdo->prepare('SELECT username, password FROM admins WHERE username = :username');
        $stmt->execute([':username' => $_POST['username']]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($user && $_POST['password'] == $user['password']) {
            session_start();
            setcookie("admin", "true", time() + (86400 * 3), "/");
        } else {
            echo "login failed";
        }
    } catch (PDOException $e) {
        echo "Database Error: " . $e->getMessage();
    }
}
?>
<html>
    <head><link href="style.css" rel="stylesheet" /></head>
    <body style="text-align: center">
        <div class="login_box">
            <form method="POST">
                username: <input type="text" name="username" required><br><br>
                password: <input type="password" name="password" required><br><br>
                <input type="submit" name="submit" value="LOGIN">
            </form>
        </div>
        <?php
        if ($_COOKIE['admin'] == 'true') {
            echo <<<EOF
                <a href="/display.php">VIEW LIST OF STUDENTS</a>
                <a href="/add.php">ADD NEW STUDENT</a>
                <a href="/edit.php">EDIT STUDENT DETAILS</a>
                <a href="/delete.php">DELETE STUDENT</a>
            EOF;
        }
        ?>
    </body>
</html>
