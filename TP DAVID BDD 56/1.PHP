<!DOCTYPE html>
<html lang=es>
<head>
    <title>Mi primer pagina </title>
</head>
    <body>
        <h3>Cargamos La Venta a La Base de Datos.</h3>
        <?php
            //localhost = Nombre del servidor
            //$Conexion = con la bbd mysql, Ubicacion de posibles problemas
            //Root = Nombre usuario 
            //Contraseña = Password del servidor
            //Problemas de conexion = error al intercambiar 
             $conexion = mysql_connect('localhost','root','','contraseña') or die("Problemas en la conexion");
            
            mysql_select_db("BASESISTEMA", $conexion) or die("Problemas en la seleccion de la base de datos");
                //mysql_select_db = Selecciona la bdd por sus credenciales a la tabla
            mysql_query("execute insertar_venta (31, 55,'12/10/2020',lápices', 70, 8, 3,200)");
                //mysql_query = Consulta en la bdd
            mysql_close($conexion);
                //mysql_close = Finaliza la conexion a la bdd
            echo "La venta fue subida con exito.";  
                //echo = Visualizacion de mensaje por ventana
        ?>
    </body>
</html>