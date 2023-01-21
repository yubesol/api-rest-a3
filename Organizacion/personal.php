<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET,POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Conecta a la base de datos  con usuario, contraseña y nombre de la BD
$servidor = "localhost"; $usuario = "root"; $contrasenia = ""; $nombreBaseDatos = "empleados";
$conexionBD = new mysqli($servidor, $usuario, $contrasenia, $nombreBaseDatos);
 

// Consulta datos y recepciona una clave para consultar dichos datos con dicha clave
if (isset($_GET["consultar"])){
    $sqlEmpleaados = mysqli_query($conexionBD,"SELECT * FROM personal WHERE id=".$_GET["consultar"]);
    if(mysqli_num_rows($sqlEmpleaados) > 0){
        $empleaados = mysqli_fetch_all($sqlEmpleaados,MYSQLI_ASSOC);
        echo json_encode($empleaados);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}


//borrar pero se le debe de enviar una clave ( para borrado )
if (isset($_GET["borrar"])){
    $sqlEmpleaados = mysqli_query($conexionBD,"DELETE FROM personal WHERE id=".$_GET["borrar"]);
    if($sqlEmpleaados){
        echo json_encode(["success"=>1]);
        exit();
    }
    else{  echo json_encode(["success"=>0]); }
}


//Inserta un nuevo registro y recepciona en método post los datos de nombre y correo
if(isset($_GET["insertar"])){
    $data = json_decode(file_get_contents("php://input"));
    $nombre=$data->nombre;
    $apellido=$data->apellido;
    $correo=$data->correo;
    $rol=$data->rol;
    $id_organizacion=$data->id_organizacion;
        if(($correo!="")&&($nombre!="")&&($apellido!="")&&($rol!="")&&($id_organizacion!="")){
            
    $sqlEmpleaados = mysqli_query($conexionBD,"INSERT INTO personal(nombre,apellido,correo,rol,id_organizacion) VALUES('$nombre','$apellido','$correo','$rol','$id_organizacion') ");
    echo json_encode(["success"=>1]);
        }
    exit();
}


// Actualiza datos pero recepciona datos de nombre, correo y una clave para realizar la actualización
if(isset($_GET["actualizar"])){
    
    $data = json_decode(file_get_contents("php://input"));

    $id=(isset($data->id))?$data->id:$_GET["actualizar"];
    $nombre=$data->nombre;
    $apellido=$data->apellido;
    $correo=$data->correo;
    $rol=$data->rol;
    $id_organizacion=$data->id_organizacion;
    
    $sqlEmpleaados = mysqli_query($conexionBD,"UPDATE personal SET nombre='$nombre',apellido='$apellido',correo='$correo', rol='$rol', id_organizacion='$id_organizacion' WHERE id='$id'");
    echo json_encode(["success"=>1]);
    exit();
}

// Consulta todos los registros de la tabla personal

$sqlEmpleaados = mysqli_query($conexionBD,"SELECT * FROM personal ");
if(mysqli_num_rows($sqlEmpleaados) > 0){
    $empleaados = mysqli_fetch_all($sqlEmpleaados,MYSQLI_ASSOC);
    echo json_encode($empleaados);
}
else{ echo json_encode([["success"=>0]]); }


?>