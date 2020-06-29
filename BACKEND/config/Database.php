<?php 

  class Database {
    // DB Params
    private $host = 'localhost';
    private $db_name = 'techp_db';
    private $username = '';
    private $password = '';
    private $conn = null;

    // DB Connect
    public function connect() {
//      $this->conn = null;

      try {
        $this->conn = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->db_name, $this->username, $this->password,[
            PDO::ATTR_PERSISTENT => true,
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET sql_mode="TRADITIONAL"'] );
        $this->conn->exec("set names utf8");

        $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      } catch(PDOException $e) {
        echo 'Connection Error: ' . $e->getMessage();
      }
      
    

      return $this->conn;
    }
  }
