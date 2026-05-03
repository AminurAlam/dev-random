<html>
    <body>
        <form method="POST">
            number: <input type="text" name="num" required><br><br>
            <input type="submit" name="submit" value="RUN">
        </form>
        <pre>
            <?php
            if(isset($_POST['submit']))
                echo sqrt($_POST['num']);;
            ?>
        </pre>
    </body>
</html>
