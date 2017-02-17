begin transaction



-- Assumption: tax amount does not vary, making all procedurePrices the final prices.

create table pet 
(
petId int identity not null,
ownerId int not null,
petName varchar(100),
petType varchar(50),
petAge int not null,

constraint pk_petId primary key (petId),

);

create table owner 
(
ownerId int identity not null,
ownerName varchar(50) not null,
owneraddress varchar(100) not null,
visitId int not null,

constraint pk_ownerId primary key (ownerId),

);

create table prodecure
(
procedureId int identity not null,
procedureName varchar(100) not null,
procedurePrice int not null,


constraint pk_procedureId primary key (procedureId)
);

create table visit
(
visitId int identity not null,
visitDate date not null,
procedureId int null,
ownerId int not null,
-- petId int not null,

constraint pk_visitId primary key (visitId),

);
alter table pet 
add constraint fk_ownerId foreign key (ownerId) references owner(ownerId);

alter table owner
add constraint fk_visitId foreign key (visitId) references visit(visitId);

alter table visit
add constraint fk_visit_ownerId foreign key (ownerId) references owner(ownerId);

alter table visit
add constraint fk_procedureId foreign key (procedureId) references prodecure(procedureId);



commit