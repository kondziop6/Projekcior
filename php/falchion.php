<?php
header('Content-Type: application/json');
$mysqli = new mysqli("localhost", "root", "", "angular");
if ($mysqli->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $mysqli->connect_error]));
}
$skinsQuery = "SELECT * FROM skin WHERE Id BETWEEN 18 AND 35";
$skinsResult = $mysqli->query($skinsQuery);

$skins = [];

if ($skinsResult->num_rows > 0) {
    while ($row = $skinsResult->fetch_assoc()) {
        $skins[] = $row;
    }
}

$mysqli->close();

echo json_encode($skins);
?>
