//Create = Crear la base de datos
Create database BASESISTEMA

//Use = Especifica la bdd a utilizar 
  USE BASESISTEMA

//CREATE TABLE = Crea una tabla en la BBD 
//Articulos = Nombre de la tabla a crear
//Items = Campos de la tabla a crear segun sus datos 

CREATE TABLE Articulos
  (
    NumArt int NOT NULL, 
    Descripcion char (30), 
    Precio Real, 
    Stock int CONSTRAINT 
    PK_nombreRestriccion1Art PRIMARY KEY(NumArt),
  );

  //CREATE TABLE = Crea una tabla en la BBD 
  //articulos = Nombre de la tabla a crear
  //Items = Campos de la tabla a crear segun sus datos 

CREATE TABLE compras 
  (
    NumCompra int NOT NULL,
    Descripcion char (30),
    Valorcomp Real,
    NumArt int,
    Factura int,
    Proveedor int,
    cantidad int,
    Fecha Date
    CONSTRAINT PK_nombreRestriccion1Comp PRIMARY KEY(NumCompra),
    CONSTRAINT FK_nombreRestriccion1Comp FOREIGN KEY (NumArt) REFERENCES articulos (NumArt),
  );

 

  //CREATE TABLE = Crea una tabla en la BBD 
  //Articulos = Nombre de la tabla a crear
  //Items = Campos de la tabla a crear segun sus datos 
CREATE TABLE ventas
  (
    NumVentas int NOT NULL,
    Factura int,
    Fecha Date,
    Descripcion char (30),
    ValorVent Real,
    NumArt int,
    Cliente int,
    cantidad int
    CONSTRAINT PK_nombreRestriccion1vent PRIMARY KEY(NumVentas),
    CONSTRAINT FK_nombreRestriccion1vent FOREIGN KEY (NumArt) REFERENCES Articulos (NumArt)
  );

----------------------------------------------------------------------------------------------------------------------

procedimiento que da de alta una venta en la tabla ventas que se llama en el html php mysql_query con la palabra execute y se le da el nombre del procedimiento y se la pasan los parametros ------------- Procedimiento que se llama en MySql_query (execute insertar_venta ( 31, 55,'12/10/2020',lápices', 70, 8, 3,200)); 

-------------

create procedure insertar_venta 
(
  declare 
  @NumVentas int, 
  @Factura int, 
  @Fecha Date, 
  @Descripcion char (30), 
  @ValorVent Real, 
  @NumArt int, 
  @Cliente int,  
  @cantidad int
) as

insert into ventas  
values (
    @NumVentas, 
    @Factura, 
    @Fecha, 
    @Descripcion, 
    @ValorVent, 
    @NumArt, 
    @Cliente,  
    @cantidad
  )

go 

------------------------------------------------------------------------------------------------------

Procedimiento que se llama en MySql_query (execute insertar_compra ( 55, lápices, 700, 8, 32));
  procedimiento que da de alta una compra en la tabla compras que se llama en el html php mysql_query con la palabra execute y se le da el nombre del procedimiento y se la pasan los parametros  ----------Procedimiento que se llama en MySql_query (execute insertar_compra ( 55, lápices, 700, 8, 32));

--------------
//Creando un llamado insertar_compra 
//Recibe 5 datos como parametros para luego insertarlos en la bdd.

Create procedure insertar_compra
 (
    declare 
    @Numcompra int, 
    @Descripcion char(30), 
    @Valorcomp Real, 
    @NumArt int, 
    @proveedor int
  ) 
  
as

insert into compras 
values (
    @Numcompra, 
    @Descripcion, 
    @Valorcomp Real,
    @NumArt, 
    @Proveedor
  );

Go

(Trigger asociado a la tabla compras) que actualiza el campo 
stock de la tabla artículos luego de que sucede un 
insert en esta tabla

----------

//Creando un disparador de eventos llamado ActualizaStockPorInsertEnCompras 
//Que como su nombre lo indica se activa al insertar un elemento a la bdd llamada compras
//Actualizando la tabla articulos

  CREATE TRIGGER ActualizaStockPorInsertEnCompras AFTER INSERT ON compras FOR EACH
  ROW
  BEGIN
  UPDATE articulos SET Stock =Stock + new.cantidad;
  where NumArt=new.articulo
  End

---------------------------------------------------------------------------------------------------------------------------------

trigger asociado a la tabla ventas
//Creando un disparador de eventos llamado ActualizaStockporInsertEnVentas 
//Que como su nombre lo indica se activa al insertar un elemento a la bdd llamada ventas
//Actualizando la tabla articulos

  CREATE TRIGGER ActualizaStockporInsertEnVentas AFTER INSERT ON ventas FOR EACH
  ROW
  BEGIN
  UPDATE articulos SET Stock =Stock - new.cantidad;
  where  NumArt =new.articulo
  End

  //EJEMPLO(Creado por mi): 
  CREATE TRIGGER ActualizarPedidos
  AFTER INSERT ON TABLAPEDIDOS
  ROW 
  BEGIN 
  UPDATE TABLAPEDIDOS SET CantidadPedidos = CantidadPedidos - new.CantidadPedidos;
  where  IdPedido =new.CantidadPedidos
  End