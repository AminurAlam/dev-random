<?php
if (isset($_POST['submit'])) {
    $pdo = new PDO('sqlite:students.sqlite');
    $stmt = $pdo->query('SELECT username, password FROM admins WHERE username = ' . $_POST['username']);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($user && $_POST['password'] == $user['password'])
        setcookie('admin', 'true', time() + (86400 * 3), '/');
}
?>
<html><body>
    <form method="POST">
        username: <input type="text" name="username">
        password: <input type="password" name="password">
        <input type="submit" name="submit" value="LOGIN">
    </form>
    <a href="/display.php">VIEW LIST OF STUDENTS</a>
    <a href="/add.php">ADD NEW STUDENT</a>
    <a href="/edit.php">EDIT STUDENT DETAILS</a>
    <a href="/delete.php">DELETE STUDENT</a>
</body></html>
