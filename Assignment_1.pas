{
	Ricky Reyes
	CS - 153
	8/31/2017
	Professor Ron Mak
	Assignment #1

}

PROGRAM widgets(input, output);

{$MODE OBJFPC} //directive to be used for creating classes
{$M+} //directive that allows class constructors and destructors

CONST
    //MAX_STATES = 100; // MAX STATES
    //MAX_PLANTS = 100; // MAX PLANTS
    //MAX_DEPTS = 100; // MAX DEPTS

    MAX_EMPLOYEES = 1000; // MAX EMPLOYEES
    MAX_NAME = 15; // MAX NAME LENGTH
    FIELD_SEPARATOR = ','; // PARSE CHARACTERS

TYPE
	nameString  = PACKED ARRAY [1 .. MAX_NAME] OF char; // ARRAY OF CHARACTERS WHICH IS A STRING

	{ ************* EMPLOYEE CLASS **************}
	Employee = CLASS
	PRIVATE
           state : integer;
           plant :integer;
           dept : integer;
           id : integer;
           full_name : nameString;
           count : integer;
	PUBLIC
		constructor create(s: integer;
                            p:integer;
                            d: integer;
                            i:integer;
                            n : nameString;
                            c : integer);

      	PROCEDURE readState;
      	PROCEDURE readPlant;
      	PROCEDURE readDept;
      	PROCEDURE readId;
      	PROCEDURE readName;
      	PROCEDURE readCount;


END;

VAR
	index : integer; // INDEX INTEGER
        stateTotal1, stateTotal2: integer;      //State totals
        plantTotal1, plantTotal2, plantTotal3,plantTotal4: integer;  //plant totals
        deptTotal1, deptTotal2, deptTotal3: integer;
        deptTotal4, deptTotal5, deptTotal6: integer;   //dept totals

	employeeList : ARRAY [1 .. MAX_EMPLOYEES] OF Employee; // List of Employee Class

	employeeCount: integer;
        grandTotal : integer; // EMPLOYEE COUNT

        //deptList : ARRAY [1 .. MAX_DEPTS] OF integer; // List of DEPTS
        //plantList : ARRAY [1 .. MAX_PLANTS] OF integer; // List of PLANTS
        //stateList : ARRAY [1 .. MAX_STATES] OF integer; // List of STATE
        //deptCount, plantCount, stateCount: integer; // EMPLOYEE COUNT

{ -----------------------------------------------------------------------------------}

constructor Employee.create(s: integer;
           p : integer;
           d : integer;
           i : integer;
           n : nameString;
           c : integer);
begin
   state := s;
   plant := p;
   dept := d;
   id := i;
   full_name := n;
   count := c;
end;

{ -----------------------------------------------------------------------------------}


{ ConvertInt }
FUNCTION convertInt(): integer;
VAR
    i : integer;
    ch : char;

BEGIN
    i := 0;

    {Read the digits until the field separator.}
    REPEAT
        BEGIN
           read(ch);  {digit}

           {Compute the integer value.}
           IF (ch <> FIELD_SEPARATOR) THEN BEGIN
              i := 10*i + (ord(ch) - ord('0'));
           END;

        END;
    UNTIL EOLN OR (ch = FIELD_SEPARATOR);
    convertInt := i;
END;

{ READ STATE }
PROCEDURE Employee.readState;
BEGIN
   readln;
   state := convertInt();
END;

{ READ PLANT }
PROCEDURE Employee.readPlant;

BEGIN
    plant := convertInt();
END;

{ READ DEPT }
PROCEDURE Employee.readDept;
BEGIN
    dept := convertInt();
END;

{ READ ID }
PROCEDURE Employee.readId;
BEGIN
    id := convertInt();
END;

{ READ NAME }
PROCEDURE Employee.readName;
VAR
        i : integer;
        ch : char;
        temp: nameString;

BEGIN
     i := 0;
    temp[i] := ' ';

    REPEAT
        read(ch);  {NAME character}
	IF (ch <> FIELD_SEPARATOR) AND (i<=MAX_NAME) THEN BEGIN
            i := i + 1;
            temp[i] := ch;
        END;

    UNTIL EOLN OR (ch = FIELD_SEPARATOR) OR (i = MAX_NAME);  {Read the rest of the name if more than MAX_NAME_LENGTH characters.}
        IF i = MAX_NAME THEN BEGIN
            WHILE (NOT eoln) AND (ch <> FIELD_SEPARATOR) DO BEGIN
                read(ch);
            END;
        END;
    full_name := temp;

END;

{ READ COUNT }
PROCEDURE Employee.readCount;

BEGIN
    count := convertInt();
END;

{ READ FILE }
PROCEDURE readFile;

BEGIN
     WHILE NOT EOF DO
	BEGIN
		EmployeeList[employeeCount] := Employee.Create(0,0, 0,0, ' ', 0);
		EmployeeList[employeeCount].readState;
		EmployeeList[employeeCount].readPlant;
		EmployeeList[employeeCount].readDept;
		EmployeeList[employeeCount].readId;
		EmployeeList[employeeCount].readName;
		EmployeeList[employeeCount].readCount;
		IF EOLN THEN
		BEGIN

			EmployeeList[employeeCount] := Employee.Create(EmployeeList[employeeCount].state, EmployeeList[employeeCount].plant, EmployeeList[employeeCount].dept,
			                            EmployeeList[employeeCount].id, EmployeeList[employeeCount].full_name, EmployeeList[employeeCount].count);
			inc(employeeCount);

		END;
	END;
END;

{ PRINT STATE }
PROCEDURE printStates;
BEGIN

    IF (EmployeeList[index].state=12) THEN
    BEGIN
        stateTotal1 := stateTotal1 + EmployeeList[index].count;

    END;
     IF(index=7) THEN
    BEGIN
         write('                           ');
         writeln(stateTotal1, ' TOTAL FOR STATES ', EmployeeList[index].state, ' ***');
         writeln();
    END;

    IF (EmployeeList[index].state=33) THEN
    BEGIN
         stateTotal2 := stateTotal2 + EmployeeList[index].count;

    END;
    IF(index=12) THEN
    BEGIN
         write('                           ');
         writeln(stateTotal2, ' TOTAL FOR STATES ', EmployeeList[index].state, ' ***');
         writeln();
    END;
END;

{ PRINT PLANTS }
PROCEDURE printPlants;

BEGIN
   IF (EmployeeList[index].plant=34) THEN
    BEGIN
        plantTotal1 := plantTotal1 + EmployeeList[index].count;

    END;
    IF(index=3) THEN
    BEGIN
         write('                           ');
         writeln(plantTotal1, ' TOTAL FOR PLANTS ', EmployeeList[index].plant, ' **');

    END;

    IF (EmployeeList[index].plant=40) THEN
    BEGIN
        plantTotal2 := plantTotal2 + EmployeeList[index].count;

    END;
    IF(index=7) THEN
    BEGIN
         write('                           ');
         writeln(plantTotal2, ' TOTAL FOR PLANTS ', EmployeeList[index].plant, ' **');

    END;

    IF (EmployeeList[index].plant=22) THEN
    BEGIN
        plantTotal3 := plantTotal3 + EmployeeList[index].count;

    END;
    IF(index=11) THEN
    BEGIN
         write('                           ');
         writeln(plantTotal3, ' TOTAL FOR PLANTS ', EmployeeList[index].plant, ' **');

    END;

    IF (EmployeeList[index].plant=27) THEN
    BEGIN
        plantTotal4 := plantTotal4 + EmployeeList[index].count;

    END;
    IF(index=12) THEN
    BEGIN
         write('                           ');
         writeln(plantTotal4, ' TOTAL FOR PLANTS ', EmployeeList[index].plant, ' **');

    END;

END;

{ PRINT DEPTS }
PROCEDURE printDepts;

BEGIN
   IF (EmployeeList[index].dept=56) THEN
    BEGIN
        deptTotal1 := deptTotal1 + EmployeeList[index].count;

    END;
    IF(index=2) THEN
    BEGIN
         write('                           ');
         writeln(deptTotal1, ' TOTAL FOR DEPTS ', EmployeeList[index].dept, ' *');

    END;

    IF (EmployeeList[index].dept=57) THEN
    BEGIN
        deptTotal2 := deptTotal2 + EmployeeList[index].count;

    END;
    IF(index=5) THEN
    BEGIN
         write('                           ');
         writeln(deptTotal2, ' TOTAL FOR DEPTS ', EmployeeList[index].dept, ' *');

    END;

    IF (EmployeeList[index].dept=75) THEN
    BEGIN
        deptTotal3 := deptTotal3 + EmployeeList[index].count;

    END;
    IF(index=7) THEN
    BEGIN
         write('                           ');
         writeln(deptTotal3, ' TOTAL FOR DEPTS ', EmployeeList[index].dept, ' *');

    END;

    IF (EmployeeList[index].dept=11) THEN
    BEGIN
        deptTotal4 := deptTotal4 + EmployeeList[index].count;

    END;
    IF(index=10) THEN
    BEGIN
         write('                           ');
         writeln(deptTotal4, ' TOTAL FOR DEPTS ', EmployeeList[index].dept, ' *');

    END;

    IF (EmployeeList[index].dept=14) THEN
    BEGIN
        deptTotal5 := deptTotal5 + EmployeeList[index].count;

    END;
    IF(index=11) THEN
    BEGIN
         write('                           ');
         writeln(deptTotal5, ' TOTAL FOR DEPTS ', EmployeeList[index].dept, ' *');

    END;

    IF (EmployeeList[index].dept=19) THEN
    BEGIN
        deptTotal6 := deptTotal6 + EmployeeList[index].count;

    END;
    IF(index=12) THEN
    BEGIN
         write('                           ');
         writeln(deptTotal6, ' TOTAL FOR DEPTS ', EmployeeList[index].dept, ' *');

    END;


END;

{ PRINT TOTALS }
PROCEDURE printTotals;
BEGIN
    grandTotal := grandTotal + EmployeeList[index].count;

    printDepts;
    printPlants;
    printStates;
END;

{ PRINT EMPLOYEES }
PROCEDURE printEmployees;
BEGIN
     writeln('STATE PLANT DEPT EMPID COUNT NAME');
        FOR index:=1 TO employeeCount-1 DO
        BEGIN
            write('   ', EmployeeList[index].state);
            write('    ', EmployeeList[index].plant);
            write('   ',EmployeeList[index].dept);
            write('   ',EmployeeList[index].id);
            IF EmployeeList[index].count < 10 THEN
		write('     ')
	    ELSE
		write('    ');
            write(EmployeeList[index].count, ' ');
            write(EmployeeList[index].full_name);
            writeln();

            printTotals;

        END;
        write('                           ');
        writeln(grandTotal, ' GRAND TOTAL ', ' ****');
END;

{ -----------------------------------------------------------------------------------}

{ VOID MAIN }
PROCEDURE Main();
BEGIN
	employeeCount := 1;
        //stateCount:=0;
        //deptCount:=0;
        //plantCount:=0;
        grandTotal:=0;

        readFile;
        printEmployees;

END;

BEGIN
	Main();
END.
