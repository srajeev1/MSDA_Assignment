
CREATE TABLE "OrganizationalPosition"
(
  PositionID serial NOT NULL,
  PositionName character varying(100)
  CONSTRAINT "pk_PositionID" PRIMARY KEY (PositionID)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE "EmployeeList1"
(
  employeeid serial NOT NULL,
  employeename character varying(100),
  employeepositionid integer,
  employeesupervisorid integer
  CONSTRAINT "pk_EmployeeID1" PRIMARY KEY (employeeid)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('CEO',1);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Executive Director',2);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('DIrector Systems',3);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Director Claims',3);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Director Sales',3);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Director Tax',3);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Account Executive',4);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Account Manager',5);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Claim System Representative',6);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Sales1',4);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Sales2',5);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Director Application Developent',3);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Network Admin',5);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Web Admin',5);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Application Developer1',4);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Application Developer2',5);
INSERT INTO "OrganizationalPosition"(positionname,"PositionLevel")
    VALUES ('Database Administrator',5);


INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('John Barnett',1,0);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Phyllis Smith',2,1);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Mike Jefferson',3,2);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Brad Hoffman',5,2);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Nancy Barrett',4,2);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Mary Neuger',6,2);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Dan Watt',8,5);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Sarah Kover'8,5);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Shamie Gelinal',9,7);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Sherri Walker',9,8);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Krystal  Morritt',9,7);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Thomas Prisco',9,8);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Sherri Savier',10,4);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Debra Leone',10,4);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Binta Hill',12,9);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('John Rizzo',12,10);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Marrisa Daniel',12,11);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Merl Johns',12,12);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Manoj Desai',7,2);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Fred Moffit',14,3);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Edwardo',17,19);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Michael Prisco',13,3);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Fred Lee',15,19);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Pam Candel',15,19);
INSERT INTO "EmployeeList1"(employeename,employeepositionid, employeesupervisorid)
    VALUES ('Jason Digiose',16,19);

--  SELECT statement that displays the information in the table,showing who reports to whom


select E1.employeename, 
  P1.positionname,E2.employeename Supervisor,P2.positionname Supervisor_Desig FROM 
  public."EmployeeList1" E1 inner join public."OrganizationalPosition" P1 ON E1.employeepositionid = P1.positionid
  Left Join public."EmployeeList1" E2 ON E1.employeesupervisorid =E2.employeeid
  LEFT Join public."OrganizationalPosition" P2 ON E2.employeepositionid = P2.positionid
  order by P1."PositionLevel",P2.positionID

