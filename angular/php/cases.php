<?php
$mysqli = new mysqli("localhost", "root", "", "angular");


if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

$data = json_decode(file_get_contents('php://input'), true);
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($data['player_id']) && isset($data['skin_name'])) {
    $player_id = $data['player_id'];
    $skin_name = $data['skin_name'];
    $rarity = $data['rarity'];
    $img = $data['img'];
    $skin_id = $data['skin_id'];


        $addInventoryQuery = "INSERT INTO inventory (player_id, skin_id, amount) VALUES ('$player_id', '$skin_id', 1)";
        $addInventoryResult = $mysqli->query($addInventoryQuery);
        
        if ($addInventoryResult) {
            echo json_encode(["message" => "Skin added to inventory successfully."]);
        } else {
            echo json_encode(["message" => "Failed to add skin to inventory."]);
        }
    
} else {
    echo json_encode(["message" => "Invalid request method or missing parameters."]);
}

$mysqli->close();
?>
