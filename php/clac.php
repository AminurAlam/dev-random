<html>
    <body>
        <h2>Enter Two Numbers</h2>

        <form method="POST">
            Number 1: <input type="number" name="num1" required><br><br>
            Number 2: <input type="number" name="num2" required><br><br>
            <input type="submit" name="submit" value="RUN">
        </form>
        <?php
            if(isset($_POST['submit'])) {
                $a = $_POST['num1'];
                $b = $_POST['num2'];
                $div = ($b != 0 ?  ($a/$b) : "cant div by zero")

                echo "<h3>Results:</h3>";
                echo "Add = " . $a + $b . "<br>";
                echo "Sub = " . $a - $b . "<br>";
                echo "Mul = " . $a * $b . "<br>";
                echo "Div = " . $div    . "<br>";
            }
        ?>
    </body>
</html>
