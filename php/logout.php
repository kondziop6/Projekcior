<?php
require("Tokens.php");

class TokenHandler {
    private $mysqli;
    private $returnStatus;

    public function __construct() {
        $this->mysqli = new mysqli("localhost", "root", "", "angular");
        $this->returnStatus = ["success" => true];
    }

    public function handleTokenValidation() {
        header("Content-Type: application/json");
        $data = json_decode(file_get_contents("php://input"), true);

        $tokenManager = new TokenManager($this->mysqli);
        $isTokenValid = $tokenManager->checkToken($data["token"]);

        if (!$isTokenValid) {
            $this->returnStatus["errors"]["token"] = "Token jest niepoprawny!";
            $this->returnStatus["success"] = false;
        } else {
            $tokenManager->invalidateToken($data["token"]);
            $this->returnStatus["success"] = true;
        }

        echo json_encode($this->returnStatus);
    }

    public function __destruct() {
        $this->mysqli->close();
    }
}

$tokenHandler = new TokenHandler();
$tokenHandler->handleTokenValidation();
