<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "rafaelrodrigues";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$telefone = $_POST['telefone'];
$senha = $_POST['senha'];

$sql = "SELECT * FROM usuarios WHERE telefone='$telefone' AND senha='$senha'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "success";
} else {
    echo "failure";
}
    
$conn->close();
?>