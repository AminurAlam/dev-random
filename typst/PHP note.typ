#import "snippets/note.typ": *
#import "snippets/infobox.typ": infobox
#show: template.with("PHP and MySql")

#pagebreak()

= HTTP

HTTP stands for HyperText Transfer Protocol. It is the foundational set of rules that
determines how messages are formatted and transmitted across the internet. Whenever
you type a URL into your browser, click a link, or stream a video, you are initiating
an HTTP cycle.

== The Client-Server Model

/ The Client: This is usually your web browser (Chrome, Safari, Firefox), but it can
  also be a mobile app or a smart device. The client asks for data.
/ The Server: A computer sitting in a data center somewhere that holds the website's
  files (HTML, CSS, images). The server responds to the client's request.

== Anatomy

When your browser asks a server for a webpage, it packages a raw text file containing
specific instructions. A standard request looks like this:

```http
GET /index.html HTTP/1.1
Host: www.example.com
User-Agent: Mozilla/5.0 (Windows NT 10.0)
Accept-Language: en-US
```

== A. HTTP Methods (Verbs)

The method tells the server what action the client wants to perform. The four most
common verbs are:

/ `GET`: "Please give me this resource." (Used when you load a webpage or search for
  something).
/ `POST`: "Please accept this data and create something new." (Used when submitting a
  signup form or uploading a photo).
/ `PUT` / `PATCH`: "Please update this existing information." (Used when changing
  your profile settings).
/ `DELETE`: "Please delete this resource." (Used when deleting a post or canceling an
  account).

== B. Headers

Headers are key-value pairs that provide metadata about the request. They tell the
server what browser you are using (`User-Agent`), what language you prefer
(`Accept-Language`), and what kind of data format you expect back.

== C. Body (Payload)

The body is optional. It contains the actual data being sent. A `GET` request rarely
has a body, but a `POST` request will include a body containing things like the
username and password you just typed into a form.

== Anatomy of an HTTP Response

Once the server receives the request, it processes it and sends back a response file:

```http
HTTP/1.1 200 OK
Content-Type: text/html; charset=UTF-8
Content-Length: 1254

<!DOCTYPE html>
<html>...</html>
```

== A. HTTP Status Codes

The absolute first thing the server sends back is a three-digit status code. These
numbers tell the client whether the request succeeded, failed, or requires a detour.
They fall into five main blocks:

#table(
  columns: (11%, 18%, auto),
  [STATUS], [MEANING], [FAMOUS EXAMPLE],
  [1xx], [Informational], [`101 Switching Protocols`],
  [2xx], [Success], [`200 OK` (Everything went perfectly)],
  [3xx], [Redirection], [`301 Moved Permanently` (The page is at a new link)],
  [4xx],
  [Client Error],
  [`404 Not Found` (You made a mistake; the page doesn't exist)],

  [5xx],
  [Server Error],
  [`500 Internal Server Error` (The server crashed trying to process it)],
)

== B. Response Body

If the status code indicates success, the response body will contain the actual
payload whether that is the HTML skeleton of a website, a JPEG picture, or raw JSON
data.

== Key Characteristics of HTTP

== It is Stateless

By default, HTTP is completely stateless. This means the server treats every single
request as a brand-new interaction. It has no memory. If you log into a website and
click a link to a second page, the server forgets who you are instantly.

To fix this flaw, web developers use Cookies and Tokens. These are tiny pieces of
identification text that your browser automatically attaches to every single HTTP
request headers, acting like a digital wristband at an amusement park so the server
remembers you are logged in.

== HTTP vs. HTTPS

Standard HTTP sends all its text data over the wire completely unencrypted. If you
type a password on an old HTTP site, anyone sniffing data on your Wi-Fi network can
read it in plain text.

HTTPS (the "S" stands for Secure) wraps the HTTP data inside an encrypted layer
called TLS/SSL. It scrambles the request and response text before it ever leaves your
computer, making it impossible for third parties to read your private data. Today,
HTTPS is mandatory for practically the entire web.

#pagebreak()

= HTML

At its core, HTML (HyperText Markup Language) is a system of instructions that tells
a web browser how to structure a document. "Hypertext" refers to links that connect
web pages to one another, while "Markup" means using a special syntax to annotate
plain text so the computer knows how to handle it.

== The Anatomy of an HTML Element

/ The Tag: Wrapped in angle brackets (`< >`). The opening tag marks where an element
  begins, and the closing tag (which includes a forward slash `/`) marks where it
  ends.
/ The Content: The actual text, image, or media being displayed.
/ Attributes: Extra pieces of information placed inside the opening tag to change its
  behavior or provide data. For example, a link tag uses an `href` attribute to tell
  the browser exactly where to go when clicked.

```html
<a href="https://www.google.com">Visit Google</a>
```

== The Standard Document Structure

Every single HTML page follows a strict, predictable skeleton. When a browser loads a
website, it reads this structure from top to bottom:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My First Web Page</title>
  </head>
  <body>
    <h1>Welcome to My Website</h1>
    <p>This is a paragraph of text explaining how HTML works.</p>
  </body>
</html>
```

/ `<!DOCTYPE html>`: This tells the browser, "Hey, I am using the modern version of
  HTML (HTML5). Please render this correctly."
/ `<html>`: The root element that wraps all the content on the entire page.
/ `<head>`: This is the "behind-the-scenes" section. Content here doesn't show up on
  the main page. Instead, it contains metadata, the page title (which appears on your
  browser tab), and links to external files like CSS or JavaScript.
/ `<body>`: This is the visible part of the website. Everything written here
  headings, paragraphs, images, buttons is what the user actually sees and interacts
  with.

== Semantic HTML: Writing Meaningful Code

In the early days of the web, developers used generic tags for everything. Today,
modern web development relies heavily on Semantic HTML. Semantic tags clearly
describe their meaning and purpose to both the browser and the developer.

Instead of wrapping a navigation menu or a footer in a generic container, developers
use explicit tags:

/ `<nav>`: Specifically for navigation links.
/ `<article>`: For independent, self-contained pieces of content like a blog post.
/ `<header>` and `<footer>`: For the top and bottom sections of a page or article.
/ `<aside>`: For secondary content, like a sidebar.

Using semantic tags is crucial for two reasons: SEO (Search Engine Optimization),
because search engines use them to understand what your page is actually about, and
Accessibility, because screen readers rely on these tags to help visually impaired
users navigate the page.

== The DOM (Document Object Model)

When a browser reads your HTML code, it doesn't just display it instantly. It
translates the HTML into a tree-like structure called the Document Object Model
(DOM).

Think of the DOM as a family tree of your code. The `<html>` tag is the parent,
`<head>` and `<body>` are its children, and the headings or paragraphs inside the
body are siblings. This tree structure is incredibly important because it allows
programming languages like JavaScript to target specific branches, dynamically
changing, adding, or deleting content on the fly without needing to reload the entire
web page.

== The Frontend Trio

To wrap it up, HTML never works alone in modern web development. It is part of a
foundational trio:

- HTML builds the house (walls, doors, rooms).
- CSS paints the house (colors, wallpaper, furniture layout).
- JavaScript adds the utilities (light switches, smart locks, plumbing).

#pagebreak()

= FORM

An HTML Form is the primary gateway for user interaction on the web. While a standard
HTML page is passive (users just read it), a form makes it active, allowing users to
type text, select options, upload files, and send that data over to a server.

Whether you are logging into an account, purchasing a product, or searching for a
video, you are interacting with an HTML form.

== The Container: The `<form>` Element

Every form must be wrapped inside a `<form>` container. This element acts as the
manager for all the inputs inside it, defining where the data should go and how it
should get there using two vital attributes:

/ `action`: Specifies the URL of the server-side script or API endpoint that will
  process the submitted data. (e.g., `action="/submit-login"`).
/ `method`: Specifies the HTTP method used to send the data---almost always `GET` or
  `POST`.

```html
<!-- A simple form skeleton -->
<form action="/login" method="POST">
  <!-- Input elements go here -->
  <button type="submit">Submit</button>
</form>
```

== The Core Building Blocks

Inside a form, you use various interactive elements to collect different types of
data.

== A. The `<input>` Element

The `<input>` tag is a versatile chameleon. By simply changing its `type` attribute,
it transforms into entirely different UI controls:

/ `type="text"`: A standard single-line text box.
/ `type="password"`: A text box that automatically masks the characters you type.
/ `type="email"` / `type="tel"`: Boxes optimized for specific formats, providing
  mobile keyboards with shortcuts (like the `@` symbol).
/ `type="checkbox"`: Square boxes allowing users to select multiple options.
/ `type="radio"`: Circular buttons grouped together where a user can select only one
  option from a list.

== B. The Crucial `name` Attribute

An input is completely useless to a server without a `name` attribute. The `name`
acts as the variable key for the data.

If a user types "Alice" into a text box, the server won't know what "Alice" means
unless it is paired with a name attribute:

```html
<input type="text" name="first_name" />
<!-- When submitted, the server receives: first_name=Alice -->
```

== C. Labels and Accessibility (`<label>`)

Every input should have a corresponding `<label>`. This tells the user what the input
is for. By matching the label's `for` attribute with the input's `id`, you link them
together. This is a crucial feature: clicking the label text will automatically focus
the cursor on the input field, which drastically improves mobile usability and allows
screen readers to function properly.

```html
<label for="user-email">Email Address:</label>
<input type="email" id="user-email" name="email" />
```

== Advanced Form Controls

Beyond the basic input tag, HTML offers specialized tags for complex data capture:

/ `<textarea>`: Used for multi-line text entries, like a comment section or a
  biography box. Unlike `<input>`, it requires a closing tag.
/ `<select>` and `<option>`: Creates a dropdown menu, saving valuable screen space.
/ `<input type="file">`: Opens up the user's operating system file picker to allow
  photo, video, or document uploads.

```html
<label for="country">Choose a country:</label>
<select id="country" name="country">
  <option value="us">United States</option>
  <option value="ca">Canada</option>
  <option value="uk">United Kingdom</option>
</select>
```

== Built-in Client-Side Validation

Before modern HTML5, checking if a user typed a valid email or left a password field
blank required writing custom JavaScript. Today, HTML has powerful built-in
validation attributes that block form submission and prompt the browser to display an
error message if rules are broken:

/ `required`: Prevents the form from submitting if the field is empty.
/ `minlength` and `maxlength`: Restricts the text length (e.g., forcing a password to
  be at least 8 characters).
/ `min` and `max`: Sets numerical ranges for `type="number"` or `type="date"`.
/ `pattern`: Uses Regular Expressions (Regex) to enforce strict custom patterns, like
  formatting a zip code or credit card number.

== How Forms Submit Data

When a user clicks a `<button type="submit">`, the browser halts the page, bundles
all the values from inputs that have a `name` attribute, and creates an HTTP request.

If the form uses `method="GET"`, the data is appended directly to the URL as
key-value pairs (a query string):
https://example.com/search?query=html+forms&sort=recent

If the form uses `method="POST"`, the browser packs the data into the body of the
request. By default, it formats this body as `application/x-www-form-urlencoded`
(which looks exactly like a query string, just hidden inside the body).

#infobox[
  If your form contains an `<input type="file">`, you must add a special attribute to
  your `<form>` tag: `enctype="multipart/form-data"`. If you forget this, the browser
  will only send the name of the file to the server instead of the actual file bytes!
]

#pagebreak()

= GET VS POST

#table(
  columns: 3,
  [Feature], [GET Method], [POST Method],

  [Primary Purpose],
  [Retrieves data from a server.],
  [Sends data to a server to create/update a resource.],

  [Data Location],
  [Appended to the URL as a query string.],
  [Carried inside the HTTP Request Body.],

  [Data Visibility],
  [Public. Visible in the URL bar, browser history, and server logs.],
  [Hidden. Not visible in the URL or history logs.],

  [Data Limits],
  [Restricted by maximum URL length constraints (usually \~2,048 characters).],
  [No official limit; can handle massive payloads (files, images, videos).],

  [Idempotent],
  [Yes. Running a GET request 100 times won\'t change the server\'s state.],
  [No. Running a POST request 100 times will create 100 new entries.],

  [Caching],
  [Can be cached by browsers and CDN networks to speed up loading.],
  [Never cached by default.],
)

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

#pagebreak()

= MVC

#image("assets/mvc.svg")

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
$mysqli = new mysqli("localhost","my_user","my_password","my_db");

// Check connection
if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}

// Perform query
if ($result = $mysqli -> query("SELECT * FROM Persons")) {
  echo "Returned rows are: " . $result -> num_rows;
  // Free result set
  $result -> free_result();
}

$mysqli -> close();
?>
```

== Best Practice

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

When opening files using the stream-based approach, you must tell PHP how you intend
to interact with the file. These are called "modes". Here are the most common ones:

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

#pagebreak()

= STRING MANIPULATION

/ strtoupper(): Converts to uppercase.
/ strtolower(): Converts to lowercase.
/ str_replace(search, replace, subject): Replaces string with a replacement
/ strrev(): reverses a string
/ trim(): Strips whitespace
/ strlen(string): Returns the length
