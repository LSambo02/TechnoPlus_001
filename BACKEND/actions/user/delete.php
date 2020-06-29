<?php 
  // Headers
  header('Access-Control-Allow-Origin: *');
  header('Content-Type: application/json');
  header('Access-Control-Allow-Methods: DELETE');
  header('Access-Control-Allow-Headers: Access-Control-Allow-Headers,Content-Type,Access-Control-Allow-Methods, Authorization, X-Requested-With');

  include_once '../../config/Database.php';
  include_once '../../models/Cliente.php';

  // Instantiate DB & connect
  $database = new Database();
  $db = $database->connect();

  // Instantiate blog post object
  $cliente = new Cliente($db);

  // Get raw posted data
  $data = json_decode(file_get_contents("php://input"));

  // Set ID to update
  $cliente->id = $data->id;

  // Delete post
  if($cliente->delete()) {
    echo json_encode(
      array('message' => 'Cliente removido da base de dados')
    );
  } else {
    echo json_encode(
      array('message' => 'Não foi possível concluir a remoção do cliente na BD')
    );
  }