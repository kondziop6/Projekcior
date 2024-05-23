<?php
require("Validator.php");
require("Tokens.php");

class ApiHandler {
    private $mysqli;
    private $tokenManager;
    private $returnStatus;

    public function __construct() {
        $this->mysqli = new mysqli("localhost", "root", "", "angular");
        $this->tokenManager = new TokenManager($this->mysqli);
        $this->returnStatus = ["success" => false];
    }

    public function handleRequest() {
        header("Content-Type: application/json");

        $data = json_decode(file_get_contents('php://input'), true);

        $token = $this->tokenManager->getBearerToken() ?? "";

        $isTokenValid = $_COOKIE["token"];

        if (!$isTokenValid) {
            $this->returnStatus["errors"]["token"] = "Podaj poprawny token!";
        }

        if ($isTokenValid) {
            $userId = $this->tokenManager->getTokenOwnerId($token);
            $userData = $this->mysqli->query("SELECT * FROM users WHERE Id='$userId'")->fetch_assoc();

            $this->returnStatus["data"] = $userData;
            $this->returnStatus["success"] = true;
        }

        echo json_encode($this->returnStatus["data"]);
    }

    public function __destruct() {
        $this->mysqli->close();
    }
}

$apiHandler = new ApiHandler();
$apiHandler->handleRequest();
