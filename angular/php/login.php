<?php
require("Validator.php");
require("Tokens.php");

class LoginHandler {
    private $mysqli;
    private $validator;
    private $returnStatus;

    public function __construct() {
        $this->mysqli = new mysqli("localhost", "root", "", "keydrop");
        $this->validator = new Validator($this->mysqli);
        $this->returnStatus = ["success" => false];
    }

    public function handleLogin() {
        header("Content-Type: application/json");

        $data = json_decode(file_get_contents('php://input'), true);

        $login = $this->mysqli->escape_string($data["username"]);
        $password = $this->mysqli->escape_string($data["password"]);

        if (!$login) $this->returnStatus["errors"]["login"] = "Podaj poprawny login!";
        if (!$password) $this->returnStatus["errors"]["password"] = "Podaj poprawne hasło!";

        if ($login && $password) {
            try {
                $result = $this->mysqli->query("SELECT * FROM users WHERE nick='$login' AND password='$password'");
                if ($result->num_rows == 0) {
                    $this->returnStatus["errors"]["form"] = "Login lub hasło jest niepoprawne!";
                } else {
                    $idUzytkownika = $result->fetch_assoc()["Id"];

                    $tokenManager = new TokenManager($this->mysqli);
                    $token = $tokenManager->generateToken();

                    $this->mysqli->query("INSERT INTO tokeny VALUES('$idUzytkownika', '$token', NULL)");
                    $this->returnStatus["token"] = $token;
                    $this->returnStatus["success"] = true;
                }
            } catch (Throwable $th) {
                $this->returnStatus["errors"]["internal"] = "Wystąpił błąd podczas logowania konta! Spróbuj ponownie później. Błąd: " . $th->getMessage();
            }
        }

        echo json_encode($this->returnStatus);
    }

    public function __destruct() {
        $this->mysqli->close();
    }
}

$loginHandler = new LoginHandler();
$loginHandler->handleLogin();
