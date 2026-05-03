<html>
    <body>
        <table border="1px">
        <?php
        for ($i = 0; $i < 8; $i++) {
            echo "<tr>";
            for ($j = 0; $j < 8; $j++) {
                $bg = ($i + $j) % 2 ? "black" : "white";
                echo "<td height=80px width=80px bgcolor=$bg></td>";
            }
            echo '</tr>';
        }
        ?>
        </table>
    </body>
</html>
