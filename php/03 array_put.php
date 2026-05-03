<html>
    <body>
        <form method="POST">
            key: <input type="text" name="key" required><br><br>
            value: <input type="text" name="value" required><br><br>
            <input type="submit" name="submit" value="RUN">
        </form>
        <pre>
            <?php
            $array = [0 => "zero", 5 => "five"];
            if(isset($_POST['submit'])) $array[$_POST['key']] = $_POST['value'];
            print_r($array);
            ?>
        </pre>
    </body>
</html>
