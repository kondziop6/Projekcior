<?php
require("Validator.php");
require("Tokens.php");

class RegistrationHandler {
    private $mysqli;
    private $returnStatus;

    public function __construct() {
        $this->mysqli = new mysqli("localhost", "root", "", "angular");
        $this->returnStatus = ["success" => true];
    }

    public function handleRegistration() {
        session_start();
        header("Content-Type: application/json");

        $data = json_decode(file_get_contents('php://input'), true);

        $validator = new Validator($this->mysqli);

        $login = $this->mysqli->escape_string($data["login"]);
        $password = $this->mysqli->escape_string($data["password"]);
        $age = $this->mysqli->escape_string($data["age"]);

        if (empty($password)) {
            $this->returnStatus["errors"]["password"] = "Podaj hasło!";
        } else {
            unset($this->returnStatus["errors"]["password"]);
        }

        $password = trim($password);
        $age = trim($age);

        if (strlen($login) > 20 || strlen($login) == 0 || empty($login)) {
            $this->returnStatus["errors"]["login"] = "Login musi mieć maksymalnie 20 znaków!";
        } else {
            try {
                $result = $this->mysqli->query("SELECT * FROM users WHERE nick='$login'");
                if ($result->num_rows >= 1) {
                    $this->returnStatus["errors"]["login"] = "Nick się powtarza";
                } else {
                    if (!is_numeric($age)) {
                        $this->returnStatus["errors"]["age"] = "Podaj liczbę!";
                    } else {
                        if ($age < 18) {
                            $this->returnStatus["errors"]["age"] = "Musisz mieć 18 lat!";
                        } else {
                            if ($password != "") {
                                $tokenManager = new TokenManager($this->mysqli);
                                $token = $tokenManager->generateToken();

                                $this->mysqli->query("INSERT INTO users VALUES(NULL , '$login', '$age', '$password', '100')");
                                $result = $this->mysqli->query("SELECT * FROM users WHERE nick='$login'");
                                $idUzytkownika = $result->fetch_assoc()["Id"];

                                $this->mysqli->query("INSERT INTO tokeny VALUES('$idUzytkownika', '$token', NULL)");
                                $this->returnStatus["token"] = $token;
                                $this->returnStatus["success"] = true;
                            }
                        }
                    }
                }
            } catch (Throwable $th) {
                $this->returnStatus["errors"]["internal"] = "Wystąpił błąd podczas rejestracji konta! Spróbuj ponownie później. Błąd: " . $th->getMessage();
                $this->returnStatus["success"] = false;
            }
        }

        echo json_encode($this->returnStatus);
    }

    public function __destruct() {
        $this->mysqli->close();
    }
}

$registrationHandler = new RegistrationHandler();
$registrationHandler->handleRegistration();
?>
