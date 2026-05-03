<?php
$boolean = true;
$int = 12;
$float = 1.234;

$number = 0;
$number += 1;
echo $number++;
echo ++$number;

$sgl_quotes = '$String';
$dbl_quotes = "This is a $sgl_quotes.";

$escaped   = "This contains a \t tab character.";
$unescaped = 'This just contains a slash and a t: \t';

$number = 23;
echo "I have {$number} apples to eat.\n";
echo "I have ${number} oranges to eat.\n";
echo "I have $${number} in the bank.\n";

echo true ? "yes" : "no";
?>

<?= $number; ?>
