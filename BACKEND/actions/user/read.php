<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');

  include_once '../../config/Database.php';
  include_once '../../models/Cliente.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $user = new Cliente($db);

  // Blog post query
  $result = $cliente->ler();
  // Get row count
  $num = $result->rowCount();

  // Check if any posts
  if($num > 0) {

    $clientes_arr = array();

    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
      extract($row);

    
      $cliente = array(
     'idcliente' => $idcliente,
     'username' => $username,
     'zip' => $zip,
     'logradouro' => $logradouro,
     'bairro' => $bairro,
     'cidade' => $cidade,
     'uf' => $uf,
     'complemento' => $complemento,
     'bi' => $bi
    
      );

      
      array_push($clientes_arr, $cliente);

    }

    // Turn to JSON & output
    echo json_encode(array_values($clientes_arr), JSON_UNESCAPED_UNICODE);
    

  } else {
    // No Posts
    echo json_encode(
      array('message' => 'Não há clientes registados')
    );
  }