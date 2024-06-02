<?php
// Define the server details and credentials for the MySQL database
$servername = "6.tcp.eu.ngrok.io";  // The server name or IP where the MySQL database is hosted
$port = "17183";  // The port number to connect to the MySQL server
$username = "example-user";  // The username to authenticate with the MySQL server
$password = "your-password";  // The password to authenticate with the MySQL server
$dbname = "your-database-name";  // The name of the database to connect to

// Create a new connection to the MySQL server
// The 'mysqli' class is used to perform operations on the MySQL database
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Check if the connection was successful
// If there was a connection error, the 'connect_error' property of the 'mysqli' object will be set
if ($conn->connect_error) {
  // If there was a connection error, terminate the script and display an error message
  die("Connection failed: " . $conn->connect_error);
}

// If the script has not been terminated at this point, the connection was successful
echo "Connected successfully";
?>
