<?php
  // Headers
  header('Access-Control-Allow-Origin: http://localhost');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: POST');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers, Content-Type, Access-Control-Allow-Methods');

  include_once '../../config/Database.php';
  include_once '../../models/Cliente.php';
  
  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $cliente = new Cliente($db);
  // Get raw posted data
  $data = json_decode(file_get_contents("php://input"));

  $cliente->username = $data->username;
  $cliente->password = $data->userpass;
  $cliente->bairro = $data->bairro;
  $cliente->cidade = $data->cidade;
  $cliente->complemento = $data->complemento;
  $cliente->zip = $data->zip;
  $cliente->logradouro = $data->logradouro;
  $cliente->bi = $data->bi;
  $cliente->telefones = $data->telefones;
  $cliente->emails = $data->emails;
  $cliente->uf = $data->uf;

//   var_dump($cliente->telefones);

  

//   var_dump($data);
  // Create Category
  if($cliente->create()) {
    echo json_encode(
      array('message' => 'Cliente criado com sucess')
    );
  } else {
    echo json_encode(
      array('message' => 'Não foi possível registar o cliente')
    );
  }
