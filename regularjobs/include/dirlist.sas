<!DOCTYPE html>
<html class="csstransforms no-csstransforms3d csstransitions">
<head>

	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title>Data & Insight Team Code Dump Site</title>

	<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/menu.css">
	<link rel="stylesheet" type="text/css" href="/css/main.css">

	<script type="text/javascript" src="/js/jquery.js"></script>

</head>

<body>

<div id="headercont"></div>

<script type="text/javascript">
$( "#headercont" ).load( "/header.html" );
</script>

<pre>
<code>


*
- Header ---------------------------------------------------------------------------
Program:     folder_contents.sas
Title:       Directory Information Program     
Author:      Ross Thomson
Customer:    
Scheduling:  Ad-Hoc 
 
- Description ----------------------------------------------------------------------
Define a folder path to query.  The program will then extract information for all
subdirectories under that path and create a table with...
 
* Directory:     The full path to the folder where the file is held
* name :         The name of the File
* mb :           Size of the File in MegaBytes
* owner:         Owner ID of the file (if listed)
* type:          The Type of file (eg XLS, SAS, PPT, DOC ...)
* create :       The creation Datetime.
* Last_Modified: Last Modified Datetime
* Last_Accessed: Last Accessed Datetime.
 
- Notes ----------------------------------------------------------------------------
 
 
 
- Change Log -----------------------------------------------------------------------
ID   Date      StaffId  Description
 
------------------------------------------------------------------------------------
*/
 
options nomprint nomlogic nosymbolgen nosource nosource2;

%macro DirList(Dir);
%let _jstart = %sysfunc(datetime());
 
%* Program Start -------------------------------------------------------------------;
 
%* Enter the folder path of interest;
/*%let dir = \\Uktcl02tcsas01a\di_scratch\backup;*/
 
%* create the pipe statements;
filename t1 temp;
data _null_;
  file t1;
  length line1 line2 line3 dir $300;
  dir = "&dir";
  line1 = "filename crt pipe 'dir ";
  line2 = '"'||%nrstr(trim(dir))||'" /q /s /T:C';
  line3 = trim(line1)||' '||trim(line2)||"';";
  put @3 line3;
run;
 
filename t2 temp;
data _null_;
  file t2;
  length line1 line2 line3 dir $300;
  dir = "&dir";
  line1 = "filename mfy pipe 'dir ";
  line2 = '"'||%nrstr(trim(dir))||'" /q /s /T:W';
  line3 = trim(line1)||' '||trim(line2)||"';";
  put @3 line3;
run;
 
filename t3 temp;
data _null_;
  file t3;
  length line1 line2 line3 dir $300;
  dir = "&dir";
  line1 = "filename acc pipe 'dir ";
  line2 = '"'||%nrstr(trim(dir))||'" /q /s /T:A';
  line3 = trim(line1)||' '||trim(line2)||"';";
  put @3 line3;
run;
 
%* get the core data;
%inc t1;
data base (drop= pos filename size crdate crtime);
  infile crt length=l;
  length filename $256;
  format directory $256.;
  retain directory;
  format create datetime.;
  format mb comma18.;
  format owner $10.;
  format type $10.;

  input @;
  input @1 filename $varying256. l;
 
  filename = upcase(filename);
  if trim(filename) = '' 
     or indexw(filename,'<DIR>')
     or indexw(filename,'BYTES')
     or indexw(filename,'VOLUME SERIAL NUMBER')
     or indexw(filename,'VOLUME IN DRIVE')
     or indexw(filename,'TOTAL FILES LISTED:')
    then delete;
    else do;
      if indexw(filename,'DIRECTORY') then do
        directory = left(tranwrd(filename,'DIRECTORY OF',''));
      end;
      else do;
        crdate = input(scan(filename,1,' '),ddmmyy10.);
        crtime = input(scan(filename,2,' '),time5.);
        create = dhms(crdate,0,0,crtime);
        size   = input(scan(filename,3,' '),comma18.);
        mb = (size/1024)/1024;
        owner  = left(tranwrd(trim(scan(filename,4,' ')),'TPF\',''));
        if owner = '...' 
          then do;
            pos = indexw(filename,"...");
            _name  = trim(substr(filename,pos+3));
          end;
          else  _name  = trim(scan(filename,-1,'\'));
        name = left(trim(substr(_name,10)));
        type   = left(trim(scan(filename,-1,'.')));
        drop _name;
        output;
      end;
    end;
run;
 
%* parses the file for modified date;
%inc t2;
data Modified (keep= directory name Last_modified);
  infile mfy length=l;
  format Last_modified datetime.;
  format directory $256.;
  retain directory;
 
  input @;
  input @1 filename $varying256. l;
 
  filename = upcase(filename);
  if trim(filename) = ''
     or indexw(filename,'<DIR>')
     or indexw(filename,'BYTES')
     or indexw(filename,'VOLUME SERIAL NUMBER')
     or indexw(filename,'VOLUME IN DRIVE')
     or indexw(filename,'TOTAL FILES LISTED:')
    then delete;
    else do;
      if indexw(filename,'DIRECTORY') then do;
        directory = left(tranwrd(filename,'DIRECTORY OF',''));
      end;
      else do;
        crdate = input(scan(filename,1,' '),ddmmyy10.);
        crtime = input(scan(filename,2,' '),time5.);
        Last_Modified = dhms(crdate,0,0,crtime);
        owner  = left(tranwrd(trim(scan(filename,4,' ')),'RTDOM\',''));
        if owner = '...' 
          then do;
            pos = indexw(filename,"...");
            _name  = trim(substr(filename,pos+3));
          end;
          else  _name  = trim(scan(filename,-1,'\'));
        name = left(trim(substr(_name,10)));
        type   = left(trim(scan(filename,-1,'.')));
        drop _name;
        output;
      end;
    end;
 
run;
filename mfy clear;
 
%* parses the file for last access date;
%inc t3;
data Accessed (keep= directory name Last_Accessed);
  infile acc length=l;
  format Last_Accessed datetime.;
  format directory $256.;
  retain directory;
 
  input @;
  input @1 filename $varying256. l;
 
  filename = upcase(filename);
  if trim(filename) = ''
     or indexw(filename,'<DIR>')
     or indexw(filename,'BYTES')
     or indexw(filename,'VOLUME SERIAL NUMBER')
     or indexw(filename,'VOLUME IN DRIVE')
     or indexw(filename,'TOTAL FILES LISTED:')
    then delete;
    else do;
      if indexw(filename,'DIRECTORY') then do;
        directory = left(tranwrd(filename,'DIRECTORY OF',''));
      end;
      else do;
        crdate = input(scan(filename,1,' '),ddmmyy10.);
        crtime = input(scan(filename,2,' '),time5.);
        Last_Accessed = dhms(crdate,0,0,crtime);
        owner  = left(tranwrd(trim(scan(filename,4,' ')),'RTDOM\',''));
        if owner = '...' 
          then do;
            pos = indexw(filename,"...");
            _name  = trim(substr(filename,pos+3));
          end;
          else  _name  = trim(scan(filename,-1,'\'));
        name = left(trim(substr(_name,10)));
        type   = left(trim(scan(filename,-1,'.')));
        drop _name;
        output;
      end;
    end;
run;
filename acc clear;

 
%* Join it all together;
proc sql;
  create table Contents as
  select 
    a.directory,
    a.name,
    a.mb,
    a.owner,
    a.type,
    a.create,
    b.Last_Modified,
    c.Last_Accessed
  from 
    base a
    left join Modified b
    on trim(a.directory) = trim(b.directory)
       and
       trim(a.name) = trim(b.name)
    left join Accessed c
    on trim(a.directory) = trim(c.directory)
       and
       trim(a.name) = trim(c.name)
    ;
    drop table accessed;
    drop table modified;
    drop table base;
quit;
%* Program Stop --------------------------------------------------------------------;
%let _jstop = %sysfunc(datetime());
%let _jelapse = %sysevalf(&_jstop-&_jstart);
%put INFO: elasped time - %sysfunc(putn(&_jelapse,time.));

 
%mend;


</body>
</html>
