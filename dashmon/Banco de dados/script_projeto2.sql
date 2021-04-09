use projeto;

select * from itmn_alarme;
select * from itmn_equipamento;
select * from itmn_evento;
				
create table itmn_usuario (
id_usuario integer not null auto_increment primary key,
nome_usuario varchar (100) not null,
email_usuario varchar (50) not null unique,
racf_usuario varchar (7) not null unique,
senha_usuario varchar (30) not null,
ramal_usuario varchar (10),
link_foto varchar (255)
);

select * from itmn_usuario;
describe itmn_usuario;
insert into itmn_usuario values (null, 'Professor Isidro','isidro@isidro.com','isidro','1234','9009','https://static.wikia.nocookie.net/megamangame/images/a/a6/MM10-MegaMan.png/revision/latest/scale-to-width-down/340?cb=20170523160017&path-prefix=pt-br');
                
insert into itmn_usuario values 
(null, 'MegaMan', 'mega@man.com', 'megaman', '4321', '9127876',
'https://pbs.twimg.com/profile_images/1029816770897408000/aUljTnyv.jpg');  

use projeto;

select usuario0_.id_usuario as id_usuar1_0_, usuario0_.email_usuario as email_us2_0_, usuario0_.link_foto as link_fot3_0_, usuario0_.nome_usuario as nome_usu4_0_, usuario0_.racf_usuario as racf_usu5_0_, usuario0_.ramal_usuario as ramal_us6_0_, usuario0_.senha_usuario as senha_us7_0_ from itmn_usuario usuario0_

              
                