use SigmaLicitaciones
CREATE TABLE SigmaLicitaciones.dbo.Rubro
(Id_rubro int not null identity primary key,
DescripciónRubro char(20),
TipoRubro char(20)
);

CREATE TABLE Licitacion
(Id_Licitacion int not null identity primary key,
Id_rubro int,
DescripciónLicitacion char(30),
ClienteLicitacion char(20),
TipoRubro char(20),
Constraint fk_Rubro FOREIGN KEY (Id_rubro) references Rubro (Id_rubro)
);

ALTER TABLE Licitacion DROP COLUMN TipoRubro

CREATE TABLE Unidad_de_tiempo
(Id_tiempo int not null identity primary key,
Tipo_tiempo char(10)
);

CREATE TABLE Modalidad_contrato
(Id_contrato int not null identity primary key,
Tipo_contrato char(20),
DescripcionContrato char(40)
);

CREATE TABLE LicitacionMaestro
(Id_LicitacionMaestro int not null identity primary key,
Id_licitacion int not null,
Id_tiempo int not null,
Id_contrato int not null,
FechaPresentacion datetime,
Duracion int,
MontoLicitacion bigint,
CostoLicitacion bigint,
Rentabilidad bigint,
EstadoAdjudicacion char(20),
Constraint fk_licitacion FOREIGN KEY (Id_licitacion) references Licitacion (Id_licitacion),
Constraint fk_tiempo FOREIGN KEY (Id_tiempo) references Unidad_de_tiempo (Id_tiempo),
Constraint fk_contrato FOREIGN KEY (Id_contrato) references Modalidad_contrato (Id_contrato)
);

update SigmaLicitaciones.dbo.licitacionmaestro
set fechapresentacion='2019-31-10'
where Id_LicitacionMaestro=1

CREATE TABLE Herramientas_Maestro 
(Id_herramienta int not null identity primary key,
Herramienta char(20),
ModeloHerramienta varchar(40),
DescripcionHerramienta varchar(60),
);

CREATE TABLE Herramientas_Licitacion
(Id_HerramientaLicitacion int not null identity primary key,
Id_herramienta int not null,
Cantidad int,
Valor int,
Total int,
Constraint fk_herramientas_maestro FOREIGN KEY (Id_herramienta) references Herramientas_Maestro (Id_herramienta)
);

alter table Herramientas_Licitacion Alter column Total float


ALTER TABLE Herramientas_Licitacion ADD Id_LicitacionMaestro int not null;

ALTER TABLE Herramientas_Licitacion
   ADD CONSTRAINT fk_licitacionmaestro
   FOREIGN KEY (Id_LicitacionMaestro) 
   REFERENCES LicitacionMaestro (Id_LicitacionMaestro);

CREATE TABLE Especialidad 
(Id_especialidad int not null identity primary key,
Especialidad varchar(40),
);

CREATE TABLE ManoObra_Maestro
(Id_mano_obra int not null identity primary key,
Id_especialidad int not null,
Cargo varchar (50),
DescripcionCargo varchar(60),
Constraint fk_especialidad FOREIGN KEY (Id_especialidad) references Especialidad (Id_especialidad)
);

CREATE TABLE ManoObra_Licitacion
(Id_ManoObraLicitacion int not null identity primary key,
Id_mano_obra int not null,
Id_LicitacionMaestro int not null,
Cantidad int,
AñosExperiencia int,
SueldoBase float,
Gratificacion float,
Festivos float,
Vacaciones float,
SeguroComplementario float,
AFCempresa float,
SeguroInvalidez float,
Mutual float,
OtrasAsignaciones float,
Indemnizacion float,
Constraint fk_manoobra FOREIGN KEY (Id_mano_obra) references ManoObra_Maestro (Id_mano_obra),
Constraint fk_licitacionmaestro1 FOREIGN KEY (Id_LicitacionMaestro) references  LicitacionMaestro (Id_LicitacionMaestro)
);

CREATE TABLE Equipos_Maestro
(Id_equipo int not null identity primary key,
Equipo varchar(40),
DescripcionEquipo varchar (70),
Marca varchar(40),
Modelo varchar(40),
Certificado varchar(40),
Capacidad varchar(40)
);

CREATE TABLE Equipo_licitacion
(Id_EquipoLicitacion int not null identity primary key,
Id_equipo int not null,
Id_LicitacionMaestro int not null,
Cantidad int,
Valor float,
Total float,
ValorMantencion float,
Constraint fk_equipo FOREIGN KEY (Id_equipo) references Equipos_Maestro (Id_equipo),
Constraint fk_licitacionmaestro2 FOREIGN KEY (Id_LicitacionMaestro) references  LicitacionMaestro (Id_LicitacionMaestro)
);

CREATE TABLE Epp_Maestro
(Id_epp int not null identity primary key,
Epp varchar(40),
Descripcion varchar(70),
Marca varchar(40),
Modelo varchar(40),
Medidas varchar(40)
);

CREATE TABLE Epp_licitacion
(Id_EppLicitacion int not null identity primary key,
Id_epp int not null,
Id_LicitacionMaestro int not null,
Cantidad int,
Valor float,
Total float,
Constraint fk_epp FOREIGN KEY (Id_epp) references Epp_Maestro (Id_epp),
Constraint fk_licitacionmaestro3 FOREIGN KEY (Id_LicitacionMaestro) references  LicitacionMaestro (Id_LicitacionMaestro)
);

CREATE TABLE Vehiculos_Maestro
(Id_vehiculo int not null identity primary key,
TipoVehiculo varchar(40),
Marca varchar(40),
Modelo varchar(40)
);

CREATE TABLE Vehiculos_licitacion
(Id_VehiculoLicitacion int not null identity primary key,
Id_vehiculo int not null,
Id_LicitacionMaestro int not null,
Cantidad int,
Valor float,
Total float,
Combustible float,
Constraint fk_vehiculo FOREIGN KEY (Id_vehiculo) references Vehiculos_Maestro (Id_vehiculo),
Constraint fk_licitacionmaestro4 FOREIGN KEY (Id_LicitacionMaestro) references  LicitacionMaestro (Id_LicitacionMaestro)
);


CREATE TABLE Categoria
(Id_categoria int not null identity primary key,
DescripcionCategoria varchar(70)
);

CREATE TABLE Costos_lictacion
(Id_CostosLicitacion int not null identity primary key,
Id_categoria int not null,
Id_LicitacionMaestro int not null,
Concepto varchar(40),
UnidadMedida varchar(40),
Cantidad int,
PrecioUnitario float,
Total float,
Constraint fk_costos FOREIGN KEY (Id_categoria) references Categoria (Id_categoria),
Constraint fk_licitacionmaestro5 FOREIGN KEY (Id_LicitacionMaestro) references  LicitacionMaestro (Id_LicitacionMaestro)
);

alter table Costos_licitacion Alter column Id_CostosLicitacion int not null

use sigmalicitaciones
select*
from SigmaLicitaciones.dbo.ManoObra_Licitacion

select* 
FROM SigmaLicitaciones.dbo.Epp_Maestro
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'ManoObra_Licitacion'
