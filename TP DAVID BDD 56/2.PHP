<!DOCTYPE html>
<html lang=es>
        <head>
            <title>Mi segunda  pagina </title>
        </head>
            <body>
                <h3>Cargamos La Compra a La Base de Datos.</h3>
                <?php
                    $conexion = mysql_connect('localhost','root','','contraseña') or die ("Problemas en la conexion");
                        //localhost = Nombre del servidor
                        //$Conexion = con la bbd mysql, Ubicacion de posibles problemas
                        //Root = Nombre usuario 
                        //Contraseña = Password del servidor
                        //Problemas de conexion = error al intercambiar 
                    mysql_select_db("BASESISTEMA",$conexion) or  die("Problemas en la seleccion de la base de datos"); 
                        //mysql_select_db = Selecciona la bdd por sus credenciales a la tabla
                    mysql_query("execute insertar_compra ( 55, 'lápices', 700.00, 8, 32,66,6,'22/2/2020')");
                        //mysql_query = Consulta en la bdd
                    mysql_close($conexion);
                        //mysql_close = Finaliza la conexion a la bdd
                    echo "La compra fue subida con exito.";
                        //echo = Visualizacion de mensaje por ventana
                ?>
            </body>
</html>