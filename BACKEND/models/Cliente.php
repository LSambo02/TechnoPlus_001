<?php
// Headers
header('Access-Control-Allow-Origin: localhost:8888');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods');

include_once 'Email.php';
include_once 'Telefone.php';


class Cliente{
    private $conn;

    public $id, $username, $tipo, $password, 
    $endereco,$emails, $telefones,$cidade, 
    $bairro, $uf, $complemento, $zip, $logradouro,$bi;




    public function __construct($db) {
        $this->conn = $db;
    }

    public function create(){
        $query = "INSERT INTO cliente_tbl SET username ='$this->username', 
            `password` ='$this->password', 
            `zip` ='$this->zip',        
            `logradouro` ='$this->logradouro', 
            `bairro` ='$this->bairro',
            `cidade`='$this->cidade', 
            `uf` ='$this->uf', 
            `complemento` ='$this->complemento',
            `bi` ='$this->bi'";
    

        $stmt = $this->conn->prepare($query);

        $this->username = htmlspecialchars(strip_tags($this->username));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->tipo = htmlspecialchars(strip_tags($this->tipo));
        $this->zip = htmlspecialchars(strip_tags($this->zip));
        $this->logradouro = htmlspecialchars(strip_tags($this->logradouro));
        $this->bairro = htmlspecialchars(strip_tags($this->bairro));
        $this->cidade = htmlspecialchars(strip_tags($this->cidade));
        $this->uf = htmlspecialchars(strip_tags($this->uf));
        $this->complemento = htmlspecialchars(strip_tags($this->complemento));
        $this->bi = htmlspecialchars(strip_tags($this->bi));

        $stmt->bindParam(':username', $this->username);
        $stmt->bindParam(':password', $this->password);
        $stmt->bindParam(':tipo', $this->tipo);
        $stmt->bindParam(':zip', $this->zip);
        $stmt->bindParam(':logradouro', $this->logradouro);
        $stmt->bindParam(':bairro', $this->bairro);
        $stmt->bindParam(':cidade', $this->uf);
        $stmt->bindParam(':complemento', $this->complemento);
        $stmt->bindParam(':bi', $this->bi);

        var_dump($stmt);

        if($stmt->execute()) {
            // echo("o: ");var_dump($this->conn);
            $email_obj = new Email($this->conn);
            $telefone_obj = new Telefone($this->conn);

            $this->id = $this->conn->lastInsertId();     
            
            

            
            if($email_obj->create($this->id,$this->emails)){
                echo json_encode(
                    array('message' => 'Email(s) criado com sucess')
                  );
            }else {
                echo json_encode(
                  array('message' => 'Não foi possível registar o(s) email(s)')
                );
              }
            if($telefone_obj->create($this->id,$this->telefones)){
                echo json_encode(
                    array('message' => 'Telefone(s) criado com sucess')
                  );
            }else {
                echo json_encode(
                  array('message' => 'Não foi possível registar o(s) telefone(s)')
                );
              }

              return true; 
        }
        
    }

    //Obter utilizadores
    public function ler(){
        $query = 'SELECT idcliente,username, password, zip, logradouro,bairro, cidade, uf, 
        complemento,bi, t.telefoneNumero, tel.tipo_Tel, em.emailAddress FROM cliente_tbl usr 
        INNER JOIN telefone_tbl t ON usr.idcliente = t.cliente_id INNER JOIN email_tbl em on usr.idcliente = em.cliente_id 
        INNER JOIN tipo_telefone tel on t.tipoTelefone_id = tel.idtipoTelefone GROUP BY usr.idcliente ORDER BY usr.idcliente DESC';

      // Prepare statement
      $stmt = $this->conn->prepare($query);

      // Execute query
      $stmt->execute();

      return $stmt;

    }

    public function delete() {
        $query = 'DELETE FROM cliente_tbl WHERE idcliente = id ';

        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':idcliente', $this->id);

        if($stmt->execute()) {
          return true;
        }

        printf("Error: %s.\n", $stmt->error);

        return false;
  }

}