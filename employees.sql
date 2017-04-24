CREATE TABLE employee
(
	employeeId int identity not null,
	firstName varchar(100) not null,
	lastName varchar(100) not null,
	gender char(10) not null,
	birthDate datetime not null,
	dateHired datetime not null,
	departmentId int not null,
	
	constraint pk_employeeId primary key (employeeId)
);

CREATE TABLE departmentId
(
	departmentId int identity not null,
	employeeId int not null,
	deptName 	varchar(100) not null,
	numberOfEmployees int,
	
	constraint pk_departmentId primary key (departmentId),
	constraint fk_employeeId foreign key (employeeId) references employee(employeeId),
);

CREATE TABLE project
(
	projectId int identity not null,
	employeeId int not null,
	projectName varchar (100) not null,
	projectStartDate datetime not null,
	
	
	
)


