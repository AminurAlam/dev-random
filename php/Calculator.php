<html>
<body>

<h2>Enter Two Numbers</h2>

<form method="POST">
    Number 1: <input type="number" name="num1" required><br><br>
    Number 2: <input type="number" name="num2" required><br><br>
    <input type="submit" name="submit" value="Calculate">
</form>


<?php
/*
if(isset($_POST['submit'])) {

    $a = $_POST['num1'];
    $b = $_POST['num2'];

    // Addition
    $add = $a + $b;

    // Subtraction
    $sub = $a - $b;

    // Multiplication
    $mul = $a * $b;

    // Division (avoid divide by zero)
    if($b != 0){
        $div = $a / $b;
    } else {
        $div = "Undefined (Division by zero)";
    }

    echo "<h3>Results:</h3>";
    echo "Addition = " . $add . "<br>";
    echo "Subtraction = " . $sub . "<br>";
    echo "Multiplication = " . $mul . "<br>";
    echo "Division = " . $div . "<br>";
}
*/
?>

</body>
</html>
