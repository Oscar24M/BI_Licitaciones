select*
from sigmalicitaciones.dbo.manoobra_licitacion
left join SigmaLicitaciones.dbo.ManoObra_Maestro on ManoObra_Licitacion.Id_mano_obra=ManoObra_Maestro.Id_mano_obra

use sigmalicitaciones
select*
from sigmalicitaciones.dbo.ManoObra_licitacion --18
where DescripcionCategoria like 'a%'

insert into ManoObra_Maestro
([Id_especialidad],
[Cargo],
[descripcionCargo]
)
VALUES (1,'gerente','manda');
delete from ManoObra_Maestro where cargo='gerente'


insert into Licitacion
([Id_rubro],
[DescripciónLicitacion],
[ClienteLicitacion]
)
VALUES (2,'hola','chao');


insert into Rubro
([DescripciónRubro],
[TipoRubro]
)
VALUES ('hola','chao');

insert into LicitacionMaestro
([id_licitacion],
[Id_tiempo],
[Id_contrato],
[FechaPresentacion],
[Duracion],
[MontoLicitacion],
[CostoLicitacion],
[Rentabilidad],
[EstadoAdjudicacion]
)
VALUES(2,1,1,'2019-10-02',12,656456,5456464646,4545,1);

