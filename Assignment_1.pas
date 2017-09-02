{
	Ricky Reyes
	CS - 153
	8/31/2017
	Professor Ron Mak
	Assignment #1

}

PROGRAM Assignment_1(input, output);

{$MODE OBJFPC} //directive to be used for creating classes
{$M+} //directive that allows class constructors and destructors

CONST
    MAX_EMPLOYEES = 1000; // MAX EMPLOYEES
    MAX_NAME = 15; // MAX NAME LENGTH
    FIELD_SEPARATOR = ','; // PARSE CHARACTERS


TYPE
	nameString  = PACKED ARRAY [1 .. MAX_NAME] OF char; // ARRAY OF CHARACTERS WHICH IS A STRING

	{ ************* EMPLOYEE CLASS **************}
	Employee = CLASS
	PRIVATE
           state: integer;
           plant:integer;
           dept: integer;
           id:integer;
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

	employeeList : ARRAY [1 .. MAX_EMPLOYEES] OF Employee; // List of Employee Class
        deptCount : integer; // List of Employee Class
        //plantList : ARRAY [1 .. MAX_EMPLOYEES] OF plant; // List of Employee Class
        //stateList : ARRAY [1 .. MAX_EMPLOYEES] OF state; // List of Employee Class
	employeeCount : integer; // EMPLOYEE COUNT

{ -----------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------------}

constructor Employee.create(s: integer;
           p:integer;
           d: integer;
           i:integer;
           n: nameString;
           c: integer);
begin
   state := s;
   plant := p;
   dept := d;
   id := i;
   full_name := n;
   count := c;
end;

{ -----------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------------}
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
        IF NOT EOLN THEN
        BEGIN
           read(ch);  {digit}

           {Compute the integer value.}
           if (ch <> FIELD_SEPARATOR) OR EOLN THEN BEGIN
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

    UNTIL EOLN OR (ch = FIELD_SEPARATOR) OR (i = MAX_NAME);
    full_name := temp;

END;

{ READ COUNT }
PROCEDURE Employee.readCount;

BEGIN
    count := convertInt();
END;



{ -----------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------------}
{ -----------------------------------------------------------------------------------}

{ VOID MAIN }
PROCEDURE Main();
BEGIN
	employeeCount := 1;
        deptCount:=0;
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

        writeln('STATE PLANT DEPT EMPID COUNT NAME');
        FOR index:=1 TO employeeCount DO
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
            IF (EmployeeList[index].dept=EmployeeList[index+1].dept)THEN
            BEGIN
               write('                           ');
               deptCount := EmployeeList[index].count + EmployeeList[index+1].count;
               writeln(deptCount, ' TOTAL FOR DEPARTMENT ', EmployeeList[index].dept, ' *');
               writeln();
            END;
            //write('                           ');
            //writeln(EmployeeList[index].count, ' TOTAL FOR PLANT ', EmployeeList[index].plant, ' **');
            //write('                           ');
            //writeln(EmployeeList[index].count, ' TOTAL FOR STATES ', EmployeeList[index].state, ' ***');
            //writeln();

        END;
END;

BEGIN
	Main();
END.
