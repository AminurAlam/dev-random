<?php
function valid($d) {
    $dt = DateTime::createFromFormat('Y-m-d', $d);
    return $dt->format('Y-m-d') === $d;
}

$bd = '2016-05-20';

if (valid($bd)) {
    $now = new DateTime('today');
    $bd = new DateTime($bd);
    $next = new DateTime($now->format('Y') . '-' . $bd->format('m-d'));

    if ($next < $now)
        $next->modify('+1 year');

    echo $now->diff($next)->days . " days left";
} else
    echo "the date is invalid.";
?>
