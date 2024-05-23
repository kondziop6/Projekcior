<?php
    class TokenManager { 
        private mysqli $mysqli;

        public function __construct(mysqli $connection) {
            $this->mysqli = $connection;
        }

        public function generateToken(): string {
            $token = bin2hex(random_bytes(20));

            return $token;
        } 

        private function getAuthorizationHeader(): string | null {
            $headers = null;
            if (isset($_SERVER['Authorization'])) {
                $headers = trim($_SERVER["Authorization"]);
            }
            else if (isset($_SERVER['HTTP_AUTHORIZATION'])) {
                $headers = trim($_SERVER["HTTP_AUTHORIZATION"]);
            } elseif (function_exists('apache_request_headers')) {
                $requestHeaders = apache_request_headers();
                $requestHeaders = array_combine(array_map('ucwords', array_keys($requestHeaders)), array_values($requestHeaders));
                if (isset($requestHeaders['Authorization'])) {
                    $headers = trim($requestHeaders['Authorization']);
                }
            }

            return $headers;
        }

        public function getBearerToken(): string | null {
            $headers = $this->getAuthorizationHeader();

            if (!empty($headers)) {
                if (preg_match('/Bearer\s(\S+)/', $headers, $matches)) {
                    return $this->mysqli->escape_string($matches[1]);
                }
            }
            return null;
        } 

        public function checkToken(string $token): bool {
            $token = $this->mysqli->escape_string($token);
            $result = $this->mysqli->query("SELECT * FROM tokeny WHERE token='$token'");
            
            if ($result->num_rows) {
                return true;
            } else {
                return false;
            }
        }

        public function invalidateToken(string $token): void {
            $result = $this->mysqli->query("DELETE FROM tokeny WHERE token='$token'");
        }

        public function getTokenOwnerId(string $token): string | bool {
            $token = $_COOKIE["token"];
            $result = $this->mysqli->query("SELECT * FROM tokeny WHERE token='$token'");

            if ($result->num_rows) {
                $row = $result->fetch_assoc();
                return $row["id"];
            } else {
                return false;
            }
        }
    }