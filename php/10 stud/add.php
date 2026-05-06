<html>
    <body>
        <form method="POST">
            username: <input type="text" name="username" required><br><br>
            password: <input type="password" name="password" required><br><br>
            <input type="submit" name="submit" value="RUN">
        </form>
        <pre>
            <?php
            if(isset($_POST['submit']))
                echo $_POST['username'];;
                echo $_POST['password'];;
            ?>
        </pre>
    </body>
</html>
