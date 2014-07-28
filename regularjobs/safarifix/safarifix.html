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

/* Include Header */
%include "E:\DI_Scratch\WPS Code\Live\CxA Batch\0.0.0_header.sas";

/* Include Log */
%log(SafariFix);

/* importlookup table*/
DATA WORK.IMPORT;
	INFILE 'E:\DI_Scratch\browser_lookup.csv'
		DELIMITER=','
		MISSOVER
		DSD
		LRECL=32767
		FIRSTOBS=2
	;
	LENGTH
		Browser $ 7
		Webkit_Version $ 8
		Mac_Version $ 8
		Win_Version $ 11
;
	INPUT
		Browser $
		Webkit_Version $
		Mac_Version $
		Win_Version $
;
	LABEL
		Browser = "Browser"
		Webkit_Version = "Webkit Version"
		Mac_Version = "Mac Version"
		Win_Version = "Win Version"
;
RUN;

/* join to current dimension */
proc sql;
create table SAS_BROWSER_DIMENSION_STG as
select *
from cea_dim.sas_browser_dimension a left join WORK.IMPORT b
on a.browser = b.browser
and a.browser_version = b.webkit_version;
quit;

/* back up current dimension table */
data cea_dim.sas_browser_dimension_orig;
set cea_dim.sas_browser_dimension;
run;

/* replace dimension with new table */
data cea_dim.SAS_BROWSER_DIMENSION(drop=webkit_version win_version mac_version);
set SAS_BROWSER_DIMENSION_STG;
if browser = 'Safari' then
	do;
	if index(lowcase(platform),'windows') > 0 and Win_version <> '' then browser_version = Win_version;
	else if mac_version <> '' then browser_version = Mac_version;
	else browser_version = browser_version;
	end;
run;

/* report out missing lookup values */

proc sql;
create table missing as
select *
from sas_browser_dimension_stg
where browser = 'Safari'
and webkit_version = ''
and sas_browser_dimension not in (1312,929,839,1643,1253,1829,4474,817,1748,859,1195,1084,809,812,836,930,1120);
quit;

/* reverse switch for testing */
/*data cea_dim.sas_browser_dimension;*/
/*set cea_dim.sas_browser_dimension_orig;*/
/*run;*/

/***********************************************************************************************/
/* Send the Email */
/***********************************************************************************************/
filename mymail email ("05_TB_TESCOCOMPAREMITEAM@uk.tesco.com") 
/*filename mymail email ("jamie.rodgers@i.tescobank.com") */
subject="Safari Browsers not defined in lookup table - WPS Version" 
content_type="TEXT/HTML";
ods _all_ close;
ods html body=mymail ;

/** Start writing the email in a DATA _NULL_ step **/

data _null_;
file print;
title;
    put "Hello,"; 
	put "Please find below Sarafi browsers not defined in the lookup table";
	put '&nbsp';
    put "Kind regards,"; 
    put "The Data And Insight Team"; 
run;

proc print data=missing;
run;

run;
ods _all_ close;
ods listing;

</body>
</html>
