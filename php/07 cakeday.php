<?php
function valid($dateString, $format = 'Y-m-d') {
    $dateTime = DateTime::createFromFormat($format, $dateString);
    return $dateTime && $dateTime->format($format) === $dateString;
}

function remain($birthdayString) {
    $now = new DateTime('today');
    $birthday = new DateTime($birthdayString);

    $nextBirthday = new DateTime($now->format('Y') . '-' . $birthday->format('m-d'));

    if ($nextBirthday < $now) {
        $nextBirthday->modify('+1 year');
    }

    return $now->diff($nextBirthday)->days;
}


$myBirthday = '2016-05-06';

if (valid($myBirthday)) {
    echo remain($myBirthday) . " days left\n";
} else {
    echo "The provided birthday is invalid.\n";
}

?>
