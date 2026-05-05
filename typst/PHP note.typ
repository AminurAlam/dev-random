#import "snippets/note.typ": *
#import "snippets/infobox.typ": infobox
#show: template.with("Machine Learning")

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
  align: (left, left, left),
  table.header([Feature], [Cookies], [Sessions]),

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
