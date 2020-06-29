<?php
class Email{
    private $conn;

    public $emailAddress, $email_id;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create($cliente_id, $emails){
        
        // var_dump($conn);
        foreach ($emails as $email) {
            echo "lp";

           $query = "INSERT INTO email_tbl SET `emailAddress` = '$email->emailAddress',`cliente_id` = '$cliente_id'";


            $stmt = $this->conn->prepare($query);
            
            // Clean data
            $email->emailAddress = htmlspecialchars(strip_tags($email->emailAddress));
            $this->cliente_id = htmlspecialchars(strip_tags($cliente_id));


            // Bind data
            $stmt->bindParam(':cliente_id', $cliente_id);
            $stmt->bindParam(':emailAddress', $email->emailAddress);
            
            
            if($stmt->execute()){
                echo $this->email_id;
                return true;
            }
        }
    }


}