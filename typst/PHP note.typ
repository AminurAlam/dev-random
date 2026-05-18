#import "snippets/note.typ": *
#show: template.with("PHP and MySql")

#pagebreak()

= Explain HTTP

= HTML structure

= form
== Forms example

= get vs post
== GET

Advantages:
- Since the data sent by the GET method are displayed in the URL, it is possible to
  bookmark the page with specific query string values.
- GET requests can be cached and GET requests to remain in the browser history.
- GET requests can be bookmarked.

Disadvantages:
- The GET method is not suitable for passing sensitive information such as the
  username and password, because these are fully visible in the URL query string as
  well as potentially stored in the client browser's memory as a visited page.
- Because the GET method assigns data to a server environment variable, the length of
  the URL is limited. So, there is a limitation for the total data to be sent.

= MVC
== diagram

#pagebreak()

= SESSIONS

Session support in PHP consists of a way to preserve certain data across subsequent
accesses. A visitor accessing your web site is assigned a unique id, the so-called
session id. This is either stored in a cookie on the user side or is propagated in
the URL. The session support allows you to store data between requests in the
`$_SESSION` superglobal array.

Because HTTP is a stateless protocol, the server naturally forgets who you are and
what you did as soon as a page finishes loading. Sessions solve this problem by
allowing you to store user information (like a username, user preferences, or items
in a shopping cart) across multiple pages.

When a session starts, PHP generates a unique Session ID for the user. This ID is
typically stored as a cookie in the user\'s browser, and it is sent back to the
server with every subsequent request. PHP uses this ID to retrieve the user\'s
specific variables from the server.

=== Creating a Session

```php
<?php
session_start();
?>
```

=== Accessing Session Data

```php
<?php
session_start();

$_SESSION["username"] = "john_doe";

echo "Welcome back, " . $_SESSION["username"] . "!";
?>
```

=== Destroying a Session

```php
<?php
session_start();
session_unset(); // Clear all session variables
session_destroy(); // Completely destroys the session data stored on the server
?>
```

#pagebreak()

= PHP COOKIES

// https://www.php.net/manual/en/function.setcookie.php

A cookie is a small text file that a server sends to the user\'s web browser. The
browser stores it and sends it back to the server with every subsequent request.
Cookies are primarily used to identify users, track their activity, or remember their
preferences (like language settings or a "dark mode" toggle) over time.

Unlike sessions, which rely on the server to hold the data, cookies push the storage
responsibility to the user\'s browser.

=== Creating a Cookie

```php
<?php
// Set to expire in 30 days (86400 seconds * 30)
// The "/" means the cookie is available across the entire website
setcookie("user_theme", "dark_mode", time() + (86400 * 30), "/");
?>
```

=== Accessing a Cookie

```php
<?php
if(isset($_COOKIE["user_theme"])) {
    echo "Your selected theme is: " . $_COOKIE["user_theme"];
} else {
    echo "Welcome! Using the default light theme.";
}
?>
```

=== Destroying a Cookie

```php
<?php
setcookie("user_theme", "", time() - 3600, "/");
?>
```

== Cookies vs. Sessions

#table(
  columns: 3,
  [Feature], [Cookies], [Sessions],

  [Storage Location], [client-side], [server-side],

  [Security], [Less secure], [Highly secure],

  [Capacity],
  [limited, 4KB per cookie],
  [unlimited, restricted only by your server\'s memory],

  [Lifespan],
  [Persistent. They can survive closing the browser],
  [Temporary. Expire when the user closes their browser],

  [Best Used For],
  [Remembering user preferences (themes, language)],
  [Storing sensitive information like user authentication status, or shopping carts],
)

== setcookie() signature

```asm
setcookie(
    string $name,
    string $value = "",
    int $expires= 0,
    string $path = "",
    string $domain = "",
    bool $secure = false,
    bool $httponly = false
): bool
```

/ name:
  The name of the cookie.
/ value:
  The value of the cookie. This value is stored on the clients computer; do not store
  sensitive information. Assuming the name is 'cookiename', this value is retrieved
  through `$_COOKIE['cookiename']`
/ expires:
  The time the cookie expires. This is a Unix timestamp so is in number of seconds
  since the epoch. One way to set this is by adding the number of seconds before the
  cookie should expire to the result of calling time(). For instance,
  `time()+60*60*24*30` will set the cookie to expire in 30 days. Another option is to
  use the mktime() function. If set to 0, or omitted, the cookie will expire at the
  end of the session (when the browser closes).
/ path:
  The path on the server in which the cookie will be available on. If set to '/', the
  cookie will be available within the entire domain. If set to '/foo/', the cookie
  will only be available within the /foo/ directory and all sub-directories such as
  /foo/bar/ of domain. The default value is the current directory that the cookie is
  being set in.
/ domain:
  The (sub)domain that the cookie is available to. Setting this to a subdomain (such
  as 'www.example.com') will make the cookie available to that subdomain and all
  other sub-domains of it (i.e. w2.www.example.com). To make the cookie available to
  the whole domain (including all subdomains of it), simply set the value to the
  domain name ('example.com', in this case). Older browsers still implementing the
  deprecated » RFC 2109 may require a leading . to match all subdomains.
/ secure:
  Indicates that the cookie should only be transmitted over a secure HTTPS connection
  from the client. When set to true, the cookie will only be set if a secure
  connection exists. On the server-side, it's on the programmer to send this kind of
  cookie only on secure connection (e.g. with respect to `$_SERVER["HTTPS"]`).
/ httponly:
  When true the cookie will be made accessible only through the HTTP protocol. This
  means that the cookie won't be accessible by scripting languages, such as
  JavaScript. It has been suggested that this setting can effectively help to reduce
  identity theft through XSS attacks (although it is not supported by all browsers),
  but that claim is often disputed. true or false

#pagebreak()

= SQL COMMANDS

== SELECT

The `SELECT` statement is used to retrieve data from a database. The data returned is
stored in a result table, sometimes called the result set. You can retrieve specific
columns or entire rows, and you can filter the results using a `WHERE` clause.

```sql
SELECT * FROM Employees;

SELECT FirstName, LastName, JobTitle FROM Employees;

SELECT FirstName, LastName
FROM Employees
WHERE Department = 'IT';
```

== INSERT

The `INSERT INTO` statement is used to add new rows of data to a table. You must
specify the table name and the values you want to insert. Best practice is to also
specify the exact columns you are inserting data into, ensuring the data aligns
perfectly.

```sql
INSERT INTO Employees (FirstName, LastName, Department, Salary)
  VALUES ('Jane', 'Smith', 'Marketing', 65000);
```

== UPDATE

The `UPDATE` statement is used to modify existing records in a table.

```sql
UPDATE Employees
  SET Department = 'Management', Salary = 80000
  WHERE EmployeeID = 104;
```

== DELETE

The `DELETE` statement is used to remove existing rows from a table.

```sql
DELETE FROM Employees
  WHERE EmployeeID = 102;
```

#pagebreak()

= RDBMS

RDBMS stands for Relational Database Management Systems. A database is an organized
collection of data stored in a computer system and usually controlled by a database
management system (DBMS). It is a program that allows us to create, delete, and
update a relational database.

- Data is organized in a structured, tabular format
- Tables are related to each other using keys
- Supports easy and powerful query execution
- Can handle large volumes of data efficiently

Relational Database Management Systems maintain data integrity by simulating the
following features:

- / Entity Integrity: No two records of the database table can be completely
    duplicates.
- / Referential Integrity: Only the rows of those tables can be deleted which are not
    used by other tables. Otherwise, it may lead to data inconsistency.
- / User-defined Integrity: Rules defined by the users based on confidentiality and
    access.
- / Domain integrity: The columns of the database tables are enclosed within some
    structured limits, based on default values, type of data or ranges.

== Features of RDBMS:

- Data must be stored in tabular form in DB file and it should be organized in the
  form of rows and columns.
- Each row of table is called record/tuple . Collection of such records is known as
  the cardinality of the table.
- Each column of the table is called an attribute/field. Collection of such columns
  is called the arity of the table.
- No two records of the DB table can be same. Data duplicity is therefore avoided by
  using a candidate key. Candidate Key is a minimum set of attributes required to
  identify each record uniquely.
- Tables are related to each other with the help for foreign keys.
- Database tables also allow NULL values, that is if the values of any of the element
  of the table are not filled or are missing, it becomes a NULL value. (NOTE: Primary
  key cannot have a NULL value).

== Uses of RDBMS:

- Customer Relationship Management.
- Online Retail Platforms.
- Hospital Management Systems.
- Business Intelligence.
- Data Warehousing

== Advantages of RDBMS:

- / Easy to Manage: Each table can be independently manipulated without affecting
    others.
- / Security: It is more secure consisting of multiple levels of security. Access of
    data shared can be limited.
- / Flexible: Updating of data can be done at a single point without making
    amendments at multiple files.
- / Users: RDBMS supports client-side architecture storing multiple users together.
    Facilitates storage and retrieval of large amount of data.
- / Fault Tolerance: Replication of databases provides simultaneous access and helps
    the system recover in case of disasters, such as power failures .
- / Data consistency: is ensured as RDBMS is based on ACID properties for data
    transactions.

== Disadvantages of RDBMS:

- / High Cost and Extensive Hardware: Huge costs and setups are required to make
    these systems functional.
- / Scalability: In case of addition of more data, servers along with additional
    power, and memory are required.
- / Complexity: Voluminous data creates complexity in understanding of relations and
    may lower down the performance.
- / Structured Limits: The fields or columns of a relational database system is
    enclosed within various limits, which may lead to loss of data.


== DBMS vs RDBMS

While a standard DBMS (Database Management System) might store data as flat files
(similar to a basic spreadsheet or text file), an RDBMS enforces strict rules called
normalization. This reduces data redundancy, saves storage space, and maintains
strict data integrity. Additionally, an RDBMS is designed to support multiple users
accessing and modifying the database simultaneously without causing data corruption.

#table(
  columns: 2,
  table.cell(align: center)[DBMS],
  table.cell(align: center)[RDBMS],

  [DBMS stores data as file],
  [RDBMS stores data in tabular form],

  [Data elements need to access individually],
  [Multiple data elements can be accessed at the same time],

  [No relationship between data],
  [Data is stored in the form of tables which are related to each other],

  [Normalization is not present],
  [Normalization is present],

  [DBMS does not support distributed database],
  [RDBMS supports distributed database],

  [It deals with small quantity of data],
  [It deals with large amount of data],

  [Not all Codd rules are satisfied],
  [All 12 Codd rules are satisfied],

  [Security is less],
  [More security measures provided],

  [Data fetching is slower for the large amount of data],
  [Data fetching is fast because of relational approach],
)

#pagebreak()

= PHP MYSQL CONNECTION

Connecting PHP to a MySQL database is a foundational step in building dynamic web
applications. Today, the old `mysql_connect()` function is deprecated and removed.
Instead, there are two modern, secure ways to make this connection:

/ PDO (PHP Data Objects): Highly recommended because it works with multiple database
  systems (MySQL, PostgreSQL, SQLite, etc.) and provides excellent security features.
/ MySQLi (MySQL Improved): A solid choice if you are certain your project will only
  ever use a MySQL database.

Before writing any code, you need four pieces of information about your MySQL server:

/ Hostname: Usually `localhost` or `127.0.0.1` if you are developing on your own
  computer using software like XAMPP, MAMP, or WAMP.
/ Username: The default local user is often `root`.
/ Password: The default local password is often blank (`""`) or `root`, depending on
  your setup.
/ Database Name: The name of the specific database you want to connect to (e.g.,
  `my_app_db`).

== Method A: Connecting via PDO (Recommended)

PDO uses a Data Source Name (DSN) to define the connection parameters and wraps the
connection attempt in a `try...catch` block to handle errors gracefully.

```php
<?php
// 1. Define credentials
$host = '127.0.0.1';
$db   = 'my_app_db';
$user = 'root';
$pass = '';
$charset = 'utf8mb4'; // Highly recommended for proper character encoding

// 2. Create the DSN (Data Source Name)
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";

// 3. Set PDO options for better error handling and security
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Throw exceptions on errors
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Fetch data as associative arrays
    PDO::ATTR_EMULATE_PREPARES => false, // Use real prepared statements
];

// 4. Attempt the connection
try {
    $pdo = new PDO($dsn, $user, $pass, $options);
    echo "Connected successfully using PDO!";
} catch (PDOException $e) {
    // If it fails, catch the error and display it
    echo "Connection failed: " . $e->getMessage();
    // In a real app, you might log this error instead of showing it to the user
}
?>
```

== Method B: Connecting via MySQLi (Object-Oriented)

```php
<?php
// 1. Define credentials
$servername = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "my_app_db";

// 2. Create the connection instance
$conn = new mysqli($servername, $username, $password, $dbname);

// 3. Check the connection for errors
if ($conn->connect_error) {
    // Stop script execution and print the error
    die("Connection failed: " . $conn->connect_error);
}

echo "Connected successfully using MySQLi!";
?>
```

== Step 2: Running Queries (A Quick Example)

Once connected, you will likely want to interact with your data. Here is a quick look
at how you would fetch data safely using the PDO connection we created above.

Notice the use of a prepared statement (`$stmt->prepare()`). This is crucial for
protecting your database against SQL Injection attacks.

```php
<?php
// Assuming $pdo is already connected...

// The ID we want to search for (usually comes from user input, like $_GET['id'])
$userId = 1;

// Prepare the SQL query with a placeholder (?)
$stmt = $pdo->prepare("SELECT username, email FROM users WHERE id = ?");

// Execute the query, passing the variable in an array to fill the placeholder
$stmt->execute([$userId]);

// Fetch the result
$user = $stmt->fetch();

if ($user) {
    echo "User found: " . $user['username'] . " (" . $user['email'] . ")";
} else {
    echo "No user found with that ID.";
}
?>
```

== 🔒 Best Practice for Real Applications

Never hardcode your database credentials directly into the files where you write your
queries.

Instead, create a separate file (e.g., `db_connect.php`) containing only the
connection code. Then, use `require_once 'db_connect.php';` at the top of any other
PHP file that needs database access. This keeps your code organized and allows you to
easily change passwords in one central location if needed.

#pagebreak()

= JOIN

In relational databases like MySQL, data is often broken down into multiple tables to
reduce redundancy and improve data integrity (a process called normalization).
However, when you need to view or analyze that data, you often need to stitch it back
together.

This is exactly what a JOIN operation does. It is a method used to combine rows from
two or more tables based on a related column between them.

To understand how different joins work, let's use a simple example with two tables:
`Employees` and `Departments`.

Table 1: Employees

#table(
  columns: 3,
  [EmpID], [Name], [DeptID],
  [1], [Alice], [10],
  [2], [Bob], [20],
  [3], [Charlie], [NULL],
)

Table 2: Departments

#table(
  columns: 2,
  [DeptID], [DeptName],
  [10], [HR],
  [20], [IT],
  [30], [Sales],
)

(Note: The Sales department currently has no employees.)

== INNER JOIN

The `INNER JOIN` is the most common type of join. It returns only the records that
have matching values in both tables. If a row in the first table doesn't have a
corresponding match in the second table, it is completely excluded from the result.

The Concept: Give me only the employees who belong to a department, AND only the
departments that have employees.

Example Query:

```sql
SELECT Employees.Name, Departments.DeptName
FROM Employees
INNER JOIN Departments ON Employees.DeptID = Departments.DeptID;
```

Result:

#table(
  columns: 2,
  [Name], [DeptName],
  [Alice], [HR],
  [Bob], [IT],
)

Notice that Charlie (no department) and Sales (no employees) are completely missing
from the results.

== LEFT JOIN (or LEFT OUTER JOIN)

The `LEFT JOIN` returns all records from the left table (the one mentioned first in
the query), and the matched records from the right table. If there is no match in the
right table, the result will still show the left table's data, but with `NULL` values
for the right table's columns.

The Concept: Give me a list of all employees, regardless of whether they have been
assigned to a department yet. If they have a department, show it.

Example Query:

```sql
SELECT Employees.Name, Departments.DeptName
FROM Employees
LEFT JOIN Departments ON Employees.DeptID = Departments.DeptID;
```

Result:

#table(
  columns: 2,
  [Name], [DeptName],
  [Alice], [HR],
  [Bob], [IT],
  [Charlie], [NULL],
)

Notice that Charlie is included because he is in the "Left" table (`Employees`), but
his department is `NULL`.

== RIGHT JOIN (or RIGHT OUTER JOIN)

The `RIGHT JOIN` is the exact opposite of the `LEFT JOIN`. It returns all records
from the right table, and the matched records from the left table. If there is no
match in the left table, the left side will contain `NULL` values.

The Concept: Give me a list of all departments, regardless of whether they have any
employees in them. If they have employees, list them.

Example Query:

```sql
SELECT Employees.Name, Departments.DeptName
FROM Employees
RIGHT JOIN Departments ON Employees.DeptID = Departments.DeptID;
```

Result:

#table(
  columns: 2,
  [Name], [DeptName],
  [Alice], [HR],
  [Bob], [IT],
  [NULL], [Sales],
)

Notice that the Sales department is included because it is in the "Right" table
(`Departments`), but the employee name is `NULL` because nobody works there.

#pagebreak()

= TABLES, KEYS, AND RELATIONSHIPS

A Relational Database Management System (RDBMS) organizes data into structured,
predictable formats. Instead of throwing all your data into one massive, messy
spreadsheet, an RDBMS breaks it down into distinct, logical pieces and then connects
them.

The three core building blocks that make this possible are Tables, Keys, and
Relationships.

== Tables (The Storage Containers)

A table is the fundamental structure of an RDBMS. It is designed to hold data about
one specific type of entity (like a Customer, a Product, or an Order).

A table is made up of:

/ Columns (Attributes/Fields): These define the properties of the data. For example,
  a `Students` table might have columns for `FirstName`, `LastName`, and `Email`.
/ Rows (Records/Tuples): These represent a single, individual entry of data. One row
  in the `Students` table represents one specific student.

Example: `Students` Table

#table(
  columns: 4,
  [StudentID], [FirstName], [LastName], [Email],
  [1], [Jane], [Doe], [jane\@example.com],
  [2], [John], [Smith], [john\@example.com],
)

== Keys (The Identifiers & Links)

Keys are special columns (or combinations of columns) that ensure data is unique and
allow tables to "talk" to each other.

/ Primary Key (PK): A column that uniquely identifies every row in a table. It cannot
  be `NULL` (empty), and no two rows can have the same Primary Key. In the table
  above, `StudentID` is the Primary Key.
/ Foreign Key (FK): A column in one table that references the Primary Key of another
  table. This is what creates the link (relationship) between the two tables.

Example of a Foreign Key: Imagine an `Orders` table. To know which student placed an
order, we add a `StudentID` column to the `Orders` table. Because `StudentID` points
back to the Primary Key of the `Students` table, it acts as a Foreign Key.

== Relationships (The Connections)

Relationships define how the data in one table is associated with the data in
another. There are three main types:

=== A. One-to-One (1:1)

One record in Table A is related to exactly one record in Table B. This is rare, as
this data is often just combined into a single table, but it's useful for security
(e.g., storing sensitive data separately).

/ Example: A `User` table and a `User_Security_Details` table (storing password
  hashes and recovery emails).
/ How it's built: The Primary Key of Table A is used as both the Primary Key and
  Foreign Key in Table B.

=== B. One-to-Many (1:N)

The most common relationship. One record in Table A can be related to multiple
records in Table B.

/ Example: A `Department` has many `Employees`, but an `Employee` belongs to only one
  `Department`.
/ How it's built: Place the Primary Key of the "One" side (Department) as a Foreign
  Key in the "Many" side (Employees).

=== C. Many-to-Many (M:N)

Multiple records in Table A can relate to multiple records in Table B. Relational
databases cannot handle this directly, so it requires a workaround.

/ Example: `Students` and `Courses`. One student can take many courses, and one
  course has many students.
/ How it's built: You must create a third table called a Junction Table (or
  Associative Table). This new table holds the Foreign Keys from both main tables.
  For example, an `Enrollments` table would contain `StudentID` and `CourseID`.

#pagebreak()

= FILE HANDLING


File handling is a crucial part of web development. It allows your PHP applications
to read configurations, save logs, generate reports, or process user-uploaded
documents.

PHP provides several built-in functions to handle files. These can generally be
grouped into two categories: Simple (One-liner) Functions and Stream-based (Pointer)
Functions.

== Important: File Modes

When opening files using the stream-based approach, you must tell PHP #emph[how] you
intend to interact with the file. These are called "modes". Here are the most common
ones:

#table(
  columns: (auto, auto, auto, auto),

  [Mode], [Description], [Pointer Start], [What if file doesn't exist?],
  [`r`], [Read only.], [Beginning], [Returns `FALSE` (Error).],
  [`w`],
  [Write only. Erases the contents of the file or creates a new one.],
  [Beginning],
  [Creates a new file.],

  [`a`], [Append. Writes data to the end of the file.], [End], [Creates a new file.],
  [`x`],
  [Create & Write. Exclusive write.],
  [Beginning],
  [Returns `FALSE` if file already exists.],
)

== Method 1: The Simple "One-Liner" Approach

For many everyday tasks where files aren't massively huge (like reading a small text
file or saving a simple string), PHP offers convenient functions that open, process,
and close the file all in one go.

=== 1. Reading an entire file: `file_get_contents()`
<reading-an-entire-file-file_get_contents>
This is the easiest way to read a file's contents into a string variable.

```php
<?php
$filename = "greeting.txt";

// Always check if the file exists first to avoid fatal errors!
if (file_exists($filename)) {
    $content = file_get_contents($filename);
    echo "File content: " . $content;
} else {
    echo "Error: The file does not exist.";
}
?>
```

=== 2. Writing to a file: `file_put_contents()`
<writing-to-a-file-file_put_contents>
This function writes a string to a file. By default, it acts like the `w` mode
(erasing existing content). You can pass a special flag to make it act like the `a`
mode (appending).

```php
<?php
$logFile = "activity.log";
$message = "User logged in at " . date("Y-m-d H:i:s") . "n";

// Write to the file.
// The FILE_APPEND flag tells PHP to add to the end, not overwrite.
// LOCK_EX prevents others from writing to the file at the exact same time.
file_put_contents($logFile, $message, FILE_APPEND | LOCK_EX);

echo "Log updated successfully!";
?>
```

== Method 2: The Stream/Pointer Approach

If you are dealing with very large files (where loading the whole thing into memory
with `file_get_contents` would crash your server) or if you need precise control over
reading line-by-line, you should use the stream approach.

This involves three steps: Open, Process, and Close.

=== 1. Reading a file line-by-line

```php
<?php
$filename = "large_dataset.csv";

// 1. OPEN: Open the file in 'r' (read) mode
$fileHandle = fopen($filename, "r");

if ($fileHandle) {
    // 2. PROCESS: Loop through the file until the End Of File (feof)
    while (!feof($fileHandle)) {
        // Read a single line
        $line = fgets($fileHandle);
        echo $line . "<br>";
    }

    // 3. CLOSE: Always close the file to free up server resources
    fclose($fileHandle);
} else {
    echo "Failed to open the file.";
}
?>
```

=== 2. Writing data to a file using streams

```php
<?php
$filename = "new_file.txt";

// 1. OPEN: Open in 'w' (write) mode. This will create it if it doesn't exist.
$fileHandle = fopen($filename, "w");

if ($fileHandle) {
    $text1 = "Hello Worldn";
    $text2 = "This is a new line of text.n";

    // 2. PROCESS: Write the data
    fwrite($fileHandle, $text1);
    fwrite($fileHandle, $text2);

    // 3. CLOSE: Close the connection
    fclose($fileHandle);

    echo "File written successfully!";
} else {
    echo "Could not open file for writing. Check your permissions.";
}
?>
```

== Best Practices and Common Pitfalls

+ / File Permissions: If your `file_put_contents()` or `fopen(..., 'w')` is failing,
  90% of the time it is because the web server (like Apache or Nginx) does not have
  the correct permissions to write to that specific folder on your server.
+ / Resource Leaks: If you use `fopen()`, you must use `fclose()`. Leaving files open
  unnecessarily consumes server memory and can eventually crash your PHP process.
+ / Sanitize Filenames: If a user is uploading a file or passing a filename via a URL
  parameter, never trust it directly. Always sanitize it to prevent Directory
  Traversal attacks (e.g., a user trying to access `../../../../etc/passwd`).
