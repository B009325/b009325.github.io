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

%macro campaign(table);
proc sql;
create table &table._camp as
select A.*,
case 
when sas_referrer_dimension=16690 and campaign = 'N/A - Unlisted Campaign' then 'TESCO'
when upcase(type) = 'TESCO_REFERRAL' then 'TESCO'
when sas_referrer_dimension = 13025 then 'TESCO'
when upcase(type) in ('EMAIL') then 'MARKETING_EMAIL'
when upcase(type) in ('TV','3DEMAIL','MAIL') then 'TRANSACTIONAL_EMAIL'
when upcase(type)='ORGANIC' then 'ORGANIC'
when upcase(type)='ORGANICSEARCH' then 'ORGANIC_SEARCH'
when upcase(type) in ('AFFILIATE','AGGREGATOR','NETWORK','STORES') then 'AFFILIATE'
when upcase(type) in ('PPC','SPONSOREDSEARCH') then 'PPC'
when upcase(type) in ('BANNER','BANNERAD') then 'BANNER'
when upcase(type) in ('PR','POSTER') then 'PR'
when upcase(type) in ('DISPLAY') then 'DISPLAY'
else 'OTHER' end as GroupType length=40,


case 
when sas_referrer_dimension =16690 and campaign = 'N/A - Unlisted Campaign' then 'BANK' 
when upcase(placement) in ('GATEWAY','GATEWAYDC') or (sas_referrer_dimension = 13025 and campaign = 'N/A - Unlisted Campaign')  then 'DOTCOM'
when upcase(campaign)='TESCO' and upcase(placement) in('HOME','GROCERY') then 'DOTCOM'
when upcase(campaign)='TPF' then 'BANK'
when upcase(type)='EMAIL' and upcase(campaign) ='HOME2YR' then 'RESOL'
when upcase(type)='EMAIL' and upcase(campaign) ='BBWIN14' then 'BBWIN0114'
when upcase(type)='EMAIL' and upcase(campaign) in ('R12CAR','RESOLCAR2YR','RESOLHOME') then 'RESOL'
else upcase(campaign) end as GroupCampaign length=40,

case
when sas_referrer_dimension=16690 and campaign = 'N/A - Unlisted Campaign' then 'BANK_GI'
when upcase(placement) in ('GATEWAY','GATEWAYDC') or (sas_referrer_dimension = 13025 and campaign = 'N/A - Unlisted Campaign')  then 'DOTCOM_GATEWAY'
when upcase(campaign)='TESCO' and upcase(placement) ='HOME' then 'DOTCOM_HOMEPAGE'
when upcase(campaign)='TESCO' and upcase(placement) ='GROCERY' then 'GROCERY'
when upcase(campaign)='TPF' and upcase(placement) = 'GI_INSURANCE' then 'BANK_GI'
when upcase(campaign)='TPF' and upcase(placement) in ('HOMEPAGE','INSURANCE','MOTORING') then 'BANK_BROCHURE'
when upcase(campaign)='AFFILIATE_WINDOW' then upcase(substr(creative,1,index(creative,';')-1))
when upcase(type) in ('PPC','SPONSOREDSEARCH') then upcase(creative)
when upcase(type)='EMAIL' and upcase(campaign) in ('HOME2YR','RESOLHOME') and upcase(placement)='ALL' then 'HOME'
when upcase(type)='EMAIL' and upcase(campaign) in ('R12CAR','RESOLCAR2YR') and upcase(placement)='ALL' then 'CAR2YR'
else upcase(placement) end as GroupPlacement length=50,

case 
when sas_referrer_dimension=16690 and campaign = 'N/A - Unlisted Campaign' and index(upcase(goals),'CAR') > 0 then 'CARPREQUOTE'
when sas_referrer_dimension=16690 and campaign = 'N/A - Unlisted Campaign' and index(upcase(goals),'HOME') > 0 then 'HOMEPREQUOTE'
when upcase(placement) in ('GATEWAY','GATEWAYDC') then upcase(substr(creative,1,index(creative,';')-1))
when (sas_referrer_dimension = 13025 and campaign = 'N/A - Unlisted Campaign') then 'DOTCOM_GATEWAY'
when upcase(campaign)='TESCO' and upcase(placement) ='HOME' then upcase(substr(creative,1,index(creative,';')-1))
when upcase(campaign)='TPF' and upcase(placement) = 'GI_INSURANCE' then upcase(substr(creative,1,index(creative,';')-1))
when upcase(campaign)='TPF' and upcase(placement) in ('HOMEPAGE','INSURANCE','MOTORING') then upcase(placement)
when upcase(campaign)='AFFILIATE_WINDOW' then upcase(placement)
when upcase(type)='ORGANICSEARCH' then upcase(c.query)
when upcase(type) in ('PPC','SPONSOREDSEARCH') then upcase(placement)
else upcase(substr(creative,1,index(creative,';')-1)) end as GroupCreative length=50
from &table. as A
left join
cea_dim.sas_campaign_dimension as B
on A.sas_campaign_dimension=B.sas_campaign_dimension
left join cea_dim.sas_searchterms_dimension as C
on a.sas_searchterms_dimension=c.sas_searchterms_dimension;
quit;
%mend;



</body>
</html>
