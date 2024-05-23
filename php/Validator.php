<?php
    class Validator {
        private mysqli $mysqli;
        public function __construct(mysqli $mysqliConnection) {
            $this->mysqli = $mysqliConnection;
        }

        public function validateString(string $str, int $maxLen): string | bool {
            $str = trim($str);
            if (strlen($str) > $maxLen || strlen($str) == 0) return false;
        
            return $this->mysqli->escape_string($str);
        }

        public function validateAge(string $wiek, int $maxAge): int | bool {
            if ($wiek == "") return false;
            if (!is_numeric($wiek)) return false;

            $wiek = intval($wiek);
            if ($wiek <= 0 || $wiek >= 120) return false;
            return $wiek;
        }

        public function validateId(string $id): int | bool {
            if ($id == "") return false;
            if (!is_numeric($id)) return false;

            $id = intval($id);

            $result = $this->mysqli->query("SELECT * FROM users WHERE id=$id");
            if ($result->num_rows == 0) return false;

            return $id;
        }
    }