<?php
class DatabaseConnector {
    private $mysqli;

    public function __construct() {
        $this->mysqli = new mysqli("localhost", "root", "", "angular");
        if ($this->mysqli->connect_error) {
            die("Connection failed: " . $this->mysqli->connect_error);
        }
    }

    public function fetchInventory($player_id) {
        $results = [];
        $query = "SELECT * FROM `inventory` WHERE player_id = ?";
        $statement = $this->mysqli->prepare($query);
        $statement->bind_param("s", $player_id);
        $statement->execute();
        $result = $statement->get_result();
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $transaction_id = $row['id']; 
                $skin_id = $row['skin_id'];
                $skinResult = $this->fetchSkin($skin_id);
                $results[] = ["transaction_id" => $transaction_id, "skin" => $skinResult];
            }
        }
        $statement->close();
        return $results;
    }

    public function fetchSkin($skin_id) {
        $query = "SELECT * FROM `skin` WHERE Id = ?";
        $statement = $this->mysqli->prepare($query);
        $statement->bind_param("s", $skin_id);
        $statement->execute();
        $result = $statement->get_result();
        $skinResult = [];
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $skinResult['Name'] = htmlspecialchars($row['Name']); 
                $skinResult['img'] = htmlspecialchars($row['img']); 
                $skinResult['price'] = $row['price'];
                $skinResult['Id'] = $row['Id'];
            }
        }
        $statement->close();
        return $skinResult;
    }

    public function fetchSkinPrice($transaction_id) {
        $query = "SELECT `skin`.`price` FROM `inventory` JOIN `skin` ON `inventory`.`skin_id` = `skin`.`Id` WHERE `inventory`.`id` = ?";
        $statement = $this->mysqli->prepare($query);
        $statement->bind_param("i", $transaction_id);
        $statement->execute();
        $result = $statement->get_result();
        $skin = $result->fetch_assoc();
        $price = $skin['price'];
        $statement->close();
        return $price;
    }

    public function deleteSkinFromInventory($transaction_id) {
        $query = "DELETE FROM `inventory` WHERE id = ?";
        $statement = $this->mysqli->prepare($query);
        $statement->bind_param("i", $transaction_id);
        $success = $statement->execute();
        $statement->close();
        return $success;
    }

    public function addSkinToInventory($player_id, $skin_id) {
        $query = "INSERT INTO `inventory` (player_id, skin_id) VALUES (?, ?)";
        $statement = $this->mysqli->prepare($query);
        $statement->bind_param("si", $player_id, $skin_id);
        $success = $statement->execute();
        $statement->close();
        return $success;
    }

    public function updateUserMoney($player_id, $amount) {
        $query = "UPDATE `users` SET `money` = `money` + ? WHERE `Id` = ?";
        $statement = $this->mysqli->prepare($query);
        $statement->bind_param("di", $amount, $player_id);
        $success = $statement->execute();
        $statement->close();
        return $success;
    }

    public function closeConnection() {
        $this->mysqli->close();
    }
}

$data = json_decode(file_get_contents('php://input'), true);
$return = ["success" => false];
$dbConnector = new DatabaseConnector();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($data['action']) && $data['action'] === 'fetch') {
        if (isset($data['player_id'])) {
            $player_id = $data['player_id'];
            
            $inventory = $dbConnector->fetchInventory($player_id);
            foreach ($inventory as $item) {
                $transaction_id = $item["transaction_id"]; 
                $skin = $item["skin"];
                $skin_id = $skin["Id"];
                echo '<div class="gun">'. htmlspecialchars($skin["Name"]). '<div class="box"><img src="'. htmlspecialchars($skin["img"]). '"></img><input type="checkbox" class="checkbox" data-transaction-id="'. $transaction_id .'" data-skin-id="'.$skin_id.'" role="checkbox"> <button id="sell" class="sell" data-transaction-id="'. $transaction_id .'" data-skin-id="'.$skin_id.'" role="button">Sprzedaj</button>'. '</div></div>'; // Escape HTML characters
            }
        } else {
            echo json_encode(array("message" => "Nie wszystkie wymagane parametry zostały przesłane."));
        }
    } elseif (isset($data['action']) && $data['action'] === 'delete') {
        if (isset($data['transaction_id']) && isset($data['player_id'])) {
            $transaction_id = $data['transaction_id'];
            $player_id = $data['player_id'];

            $price = $dbConnector->fetchSkinPrice($transaction_id);

            $success = $dbConnector->deleteSkinFromInventory($transaction_id);
            if ($success) {
                $dbConnector->updateUserMoney($player_id, $price);
                echo json_encode(["success" => true]);
            } else {
                echo json_encode(["message" => "Failed to delete skin from inventory."]);
            }
        } else {
            echo json_encode(["message" => "Invalid parameters."]);
        }
    } elseif (isset($data['action']) && $data['action'] === 'upgrade') {
        if (isset($data['transaction_ids']) && count($data['transaction_ids']) === 10 && isset($data['player_id'])) {
            $transaction_ids = $data['transaction_ids'];
            $player_id = $data['player_id'];

            foreach ($transaction_ids as $transaction_id) {
                $dbConnector->deleteSkinFromInventory($transaction_id);
            }
            $new_skin_ids = [17, 35, 51, 67, 82];
            $random_skin_id = $new_skin_ids[array_rand($new_skin_ids)];
            $dbConnector->addSkinToInventory($player_id, $random_skin_id);

            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["message" => "Musisz wybrać dokładnie 10 skinów do wymiany."]);
        }
    } else {
        echo json_encode(["message" => "Invalid action."]);
    }
} else {
    echo json_encode(["message" => "Invalid request method."]);
}

$dbConnector->closeConnection();
?>
