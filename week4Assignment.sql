
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

INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('CEO');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Executive Director');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('DIrector Systems');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Director Claims');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Director Sales');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Director Tax');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Account Executive');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Account Manager');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Claim System Representative');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Sales1');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Sales2');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Director Application Developent');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Network Admin');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Web Admin');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Application Developer1');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Application Developer2');
INSERT INTO "OrganizationalPosition"(positionname)
    VALUES ('Database Administrator');


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

SELECT 
  E1.employeename, 
  P1.positionname,
  '' Supervisor,
  '' Supervisor_Desig
  FROM 
  public."EmployeeList1" E1, 
  public."OrganizationalPosition" P1
  WHERE 
  E1.employeepositionid = P1.positionid AND
  E1.employeesupervisorid =0 
  UNION ALL
(SELECT 
  E1.employeename, 
  P1.positionname,  
  E2.employeename Supervisor,
  P2.positionname Supervisor_Desig
FROM 
  public."EmployeeList1" E1, 
  public."OrganizationalPosition" P1,
   public."OrganizationalPosition" P2,
   public."EmployeeList1" E2 
WHERE 
  E1.employeepositionid = P1.positionid AND
  E1.employeesupervisorid =E2.employeeid AND   
  E2.employeepositionid = P2.positionid
  order by P2.positionID)