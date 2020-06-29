<?php

class Telefone{
    private $conn;

    public $TelefoneNumero, $telefone_id,$tipoTelefone;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function create($cliente_id, $telefones){
        var_dump($telefones);

        foreach ($telefones as $telefone) {
           $query = "INSERT INTO Telefone_tbl SET 
           `telefoneNumero` = '$telefone->telefoneNumero',
           `tipoTelefone_id`=$telefone->tipoTelefone_id,
           `cliente_id` = $cliente_id";


            $stmt = $this->conn->prepare($query);

            // Clean data
            $telefone->telefoneNumero = htmlspecialchars(strip_tags($telefone->telefoneNumero));
            $this->tipoTelefone = htmlspecialchars(strip_tags($telefone->tipoTelefone));
            $this->cliente_id = htmlspecialchars(strip_tags($cliente_id));


            // Bind data
            $stmt->bindParam(':cliente_id', $cliente_id);
            $stmt->bindParam(':TelefoneNumero', $telefone->telefoneNumero);
            $stmt->bindParam(':tipoTelefone_id', $telefone->tipoTelefone);

            var_dump($stmt);
            if($stmt->execute()){
                echo $this->telefone_id;
                return true;
            }
        }
    }


}