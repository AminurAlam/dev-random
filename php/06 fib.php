<?php
function fib($n) {
    return $n < 2 ?: fib($n - 1) + fib($n - 2);
}

$n = 0;
while ($n++ < 10)
    echo fib($n) . "\n";
?>
