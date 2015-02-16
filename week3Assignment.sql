INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (1,1900.00,38.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (1,90.00,2.00,'S');    
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (2,2190.00,38.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (2,100.00,2.00,'S');    
 INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (3,600.00,15.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (3,1200.00,25.00,'V');    
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (5,2800.00,32.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (5,600.00,8.00,'S');  
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (6,1900.00,40.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (6,1000.00,0.00,'B');    
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (7,3000.00,40.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (7,500.00,0.00,'B');    
 INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (8,1800.00,40.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (8,1200.00,0.00,'B');    
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (9,2600.00,40.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (9,900.00,0.00,'B'); 
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (10,3400.00,40.00,'R');
INSERT INTO "tblWageDetail"(wagem_id, payamount, hoursworked, paytypecode)
    VALUES (10,1460.00,0.00,'B');

-- Simple inner join
-- joined EmployeeMaster Table with Wage Master table to get the Gross wages and SUI of each employee for the period (not filtered)

SELECT 
  "tblEmployeeMaster".companyid, 
  "tblEmployeeMaster".employeenumber, 
  "tblEmployeeMaster".employeename, 
  "tblWageMaster".paydate, 
  "tblWageMaster".grossamount, 
  "tblWageMaster".grosssui
FROM 
  "tblEmployeeMaster", 
  "tblWageMaster"
WHERE 
  "tblEmployeeMaster".id = "tblWageMaster".empid
ORDER BY
	"tblWageMaster".paydate ASC,
  "tblEmployeeMaster".employeename ASC; 

  -- There are 4 tables involved in the JOIN, we get the break down wages
  -- Wage Master table and PayType Table has Many to Many relationship

  SELECT 
  "tblEmployeeMaster".companyid, 
  "tblEmployeeMaster".employeenumber, 
  "tblEmployeeMaster".employeename, 
  "tblWageMaster".paydate, 
  "tblWageMaster".grossamount, 
  "tblWageMaster".grosssui, 
  "lblPayTypes".paytype, 
  "tblWageDetail".payamount, 
  "tblWageDetail".hoursworked
FROM 
  public."tblEmployeeMaster", 
  public."tblWageMaster", 
  public."tblWageDetail", 
  public."lblPayTypes"
WHERE 
  "tblEmployeeMaster".id = "tblWageMaster".empid AND
  "tblWageMaster".wagem_id = "tblWageDetail".wagem_id AND
  "tblWageDetail".paytypecode = "lblPayTypes".paytypecode
ORDER BY
  "tblWageMaster".paydate ASC, 
  "tblEmployeeMaster".employeename ASC;