<html>
    <body>
        <form method="POST">
            number: <input type="text" name="num" required><br><br>
            <input type="submit" name="submit" value="RUN">
        </form>
        <pre>
            <?php
            if(isset($_POST['submit'])) {
                $num = $_POST['num'];
                $sum = 0;
                while ($num > 0) {
                    $sum += $num % 10;
                    $num = intval($num / 10);
                }
                echo $sum;
            }
            ?>
        </pre>
    </body>
</html>
