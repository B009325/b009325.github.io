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


%let start_date = 20140301;
%let end_Date = 20140731;

*__________________________________________________________________________________________________________________________________________;
*_____________The dates are being formatted in CRM wrong for any date where the day of the month is less than 13(formatted as USA)_________;
*______________also only interested in financial products, therefore remove non financial (list confirmed by Kirsty McGowan)_______________;
*__________________________________________________________________________________________________________________________________________;

data c(drop=txtdate switch);
set dw_fact.case;
txtdate = put(ClosedDtKey, 8.);
switch = substr(txtdate, 1,4)||substr(txtdate,7,2)||substr(txtdate,5,2);
if substr(txtdate,7,2) < 13 then 
do;
ClosedDtKey = input(switch, 8.);
end;
run;

proc sql;
create table ca as
select a.*, b.prodCatName
from c a, dw_dim.prodcat b
where a.prodcatcd = b.prodcatcd;
quit;

data case;
set ca;
if ProdCatName in ('Breakdown','Gas and Electricity','Key Locator','Tesco Stores') then delete;
sCaseDt = input(put(CaseDtKey,8.),yymmdd8.);
if ClosedDtkey ne -1 then do;
sClosedDt = input(put(ClosedDtKey,8.),yymmdd8.);
end;
format sCaseDt sClosedDt date9.;
run;

*__________________________________________________________________________________________________________________________________________;
*_____________Reportable Complaints for the Period (anything resolved out with 2 working days)_____________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt1 as
select a.*
from case a
where a.ClosedDtKey >= &start_Date.
and a.ClosedDtKey <= &end_Date.
and a.CntctUsCatName = 'Complaint'
and ( intck('WEEKDAY', input(put(CaseDtKey,8.),yymmdd8.), input(put(ClosedDtKey,8.),yymmdd8.)) ) > 2
/*and ETLCtdts <= '08mar13:00.00.000000'dt*/
;
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Reportable Complaints closed within 4 weeks__________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt2 as
select a.*
from case a
where a.ClosedDtKey >= &start_Date.
and a.ClosedDtKey <= &end_Date.
and a.CntctUsCatName = 'Complaint'
and ( intck('WEEKDAY', input(put(CaseDtKey,8.),yymmdd8.), input(put(ClosedDtKey,8.),yymmdd8.)) ) > 2
and ((a.sClosedDt - a.sCaseDt)<28);
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Reportable Complaints closed between 4 & 8 Weeks_____________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt3 as
select a.*
from case a
where a.ClosedDtKey >= &start_Date.
and a.ClosedDtKey <= &end_Date.
and a.CntctUsCatName = 'Complaint'
and ( intck('WEEKDAY', input(put(CaseDtKey,8.),yymmdd8.), input(put(ClosedDtKey,8.),yymmdd8.)) ) > 2
and ((a.sClosedDt - a.sCaseDt) between 28 and 55);
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Reportable Complaints closed after 8 weeks___________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt4 as
select a.*
from case a
where a.ClosedDtKey >= &start_Date.
and a.ClosedDtKey <= &end_Date.
and a.CntctUsCatName = 'Complaint'
and ( intck('WEEKDAY', input(put(CaseDtKey,8.),yymmdd8.), input(put(ClosedDtKey,8.),yymmdd8.)) ) > 2
and ((a.sClosedDt - a.sCaseDt)>56);
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Outstanding Complaints at start of Period___________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt5 as
select a.*
from case a
where a.CaseDtKey < &start_Date.
and a.ClosedDtKey >= &start_date.
and a.CntctUsCatName = 'Complaint';
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Outstanding Complaints at end of Period______________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt6 as
select a.*
from case a
where a.CaseDtKey <= &end_date.
and a.ClosedDtKey > &end_Date.
and a.CntctUsCatName = 'Complaint';
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Complaints Upheld____________________________________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt7 as
select a.*
from case a
where a.ClosedDtKey >= &start_Date.
and a.ClosedDtKey <= &end_Date.
and a.CntctUsCatName = 'Complaint'
and a.CmpltUpheldInd = 1
and ( intck('WEEKDAY', input(put(CaseDtKey,8.),yymmdd8.), input(put(ClosedDtKey,8.),yymmdd8.)) ) > 2;
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Total Amount of Redress______________________________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
proc sql;
create table rpt8 as
select a.*
from case a
where a.ClosedDtKey >= &start_Date.
and a.ClosedDtKey <= &end_Date.
and a.CntctUsCatName = 'Complaint'
and a.CompsnAmt > 0.00
and ( intck('WEEKDAY', input(put(CaseDtKey,8.),yymmdd8.), input(put(ClosedDtKey,8.),yymmdd8.)) ) > 2;
quit;

*__________________________________________________________________________________________________________________________________________;
*_____________Create Report Macro__________________________________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;
%macro create_report(rpt, rptname, var, stat);

*Advising, Selling & Arranging;
proc sql;
create table &rpt._cat1 as
select &stat.(&var.) as cat1_count
from &rpt.
where prodcatname in ('Motorbike Insurance','Business Insurance','Car Insurance','Credit Card','Current Accounts','Health,Home Insurance','ISA','Life Insurance','Mortgage Finder',
					  'Pension','Personal Loan','Pet Insurance','PPI','Savings Accounts','Secured Loan','Travel Insurance','Van Insurance');
quit;

*General admin/customer service;
proc sql;
create table &rpt._cat2 as
select &stat.(&var.) as cat2_count
from &rpt.
where prodcatname in ('Clubcard Points for your Insurance','TPF Product related','General Website Query');
quit;

*other;
proc sql;
create table &rpt._cat3 as
select &stat.(&var.) as cat3_count
from &rpt.
where prodcatname in ('Data Protection','Marketing');
quit;

*convert missing to zero for summing - car;
data &rpt._cat1(drop=i);
  set &rpt._cat1;
  array miss(*) _numeric_;
  do i = 1 to dim(miss);
    if miss(i)=. then miss(i)=0;
  end;
run;

*convert missing to zero for summing - home;
data &rpt._cat2(drop=i);
  set &rpt._cat2;
  array miss(*) _numeric_;
  do i = 1 to dim(miss);
    if miss(i)=. then miss(i)=0;
  end;
run;

*convert missing to zero for summing - other;
data &rpt._cat3(drop=i);
  set &rpt._cat3;
  array miss(*) _numeric_;
  do i = 1 to dim(miss);
    if miss(i)=. then miss(i)=0;
  end;
run;

*merge all and sum overall;
proc sql;
create table &rpt._out as
select &rptname. as report_name, 
	   a.cat1_count, b.cat2_count, c.cat3_count, sum(a.cat1_count + b.cat2_count + c.cat3_count) as overall_count
from &rpt._cat1 a, &rpt._cat2 b, &rpt._cat3 c;
quit;

/*proc datasets lib=work nolist nodetails;*/
/*delete &rpt. &rpt._car &rpt._home &rpt._other;*/
/*quit;*/
/*run;*/

%mend create_report;

*__________________________________________________________________________________________________________________________________________;
*_____________Create Reports_______________________________________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;

%create_report(rpt1, "Reportable Complaints for the Period (anything resolved out with 2 working days)",distinct(caseid),count);
%create_report(rpt2, "Reportable Complaints closed within 4 weeks",distinct(caseid),count);
%create_report(rpt3, "Reportable Complaints closed between 4 & 8 Weeks",distinct(caseid),count);
%create_report(rpt4, "Reportable Complaints closed after 8 weeks",distinct(caseid),count);
%create_report(rpt5, "Outstanding Complaints at start of Period",distinct(caseid),count);
%create_report(rpt6, "Outstanding Complaints at end of Period",distinct(caseid),count);
%create_report(rpt7, "Complaints Upheld",distinct(caseid),count);
%create_report(rpt8, "Total Amount of Redress",CompsnAmt,sum);

*__________________________________________________________________________________________________________________________________________;
*_____________Merge Reports for output_____________________________________________________________________________________________________;
*__________________________________________________________________________________________________________________________________________;

data output;
set rpt1_out
	rpt2_out
	rpt3_out
	rpt4_out
	rpt5_out
	rpt6_out
	rpt7_out
	rpt8_out
	;
run;

*tidy up;
proc datasets lib=work nolist nodetails;
delete c ca case rpt1_out rpt2_out rpt3_out rpt4_out rpt5_out rpt6_out rpt7_out rpt8_out;
quit;
run;



</body>
</html>
