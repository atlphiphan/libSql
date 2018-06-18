select schemaid,name from arschema where name like '%OIT_Help%';
select * from field where schemaid=292 order by fieldname;
select * from field_char where schemaid=292;

/*Error Messages*/
select t1.name,t2.msgnum from filter t1, filter_message t2 where t1.filterid in (select t2.filterid from t2) order by t2.msgnum asc;
select t1.name,t2.msgnum from actlink t1, actlink_message t2 where t1.actlinkid in (select t2.actLinkid from t2) order by t2.msgnum asc;
select name from filter where filterid in (select filterid from filter_message where msgnum = '900415211');
select name from actlink where actlinkid in (select actLinkid from actlink_message where msgnum = '900415211');

/*fieldid search*/
select t1.name from arschema t1 where t1.schemaid in (select t2.schemaid from field t2 where t2.fieldid=540100100);
select * from field where fieldid=540200102;

/* Search where PSTAGE in sql call */
select distinct(name) 
from actlink t1
where t1.actLinkid in (select actLinkid from actlink_set t2 where t2.assignlong like '%PSTAGE%');

/* Search where UPDATE in direct sql call */
select distinct(name) 
from filter t1
where t1.filterid in (select filterid from filter_sql t2 where t2.assignshort like '%UPDATE%' or t2.assignlong like '%UPDATE%')
order by name;

/* Search for filters where tmpCommand is in Run If Qualification */
select distinct(name) 
from filter t1
where (t1.queryshort like '%INITIATE_CLONING%' or t1.querylong like '%INITIATE_CLONING%');

select distinct(name) 
from filter t1
where (t1.queryshort like '%INITIATE_KANA_AUTOOPEN%' or t1.querylong like '%INITIATE_KANA_AUTOOPEN%');

/* Search for Set Fields actions that sets tmpCommands to value such as BYPASS_ASSIGNED_TO_CHECK */
select distinct(name) 
from filter t1, filter_set t2 
where (t2.assignshort like '%BYPASS_ASSIGNED_TO_CHECK%' or t2.assignlong like '%APP-Management%') and t1.filterid=t2.filterid
order by t1.name;

/* Search for Push Fields actions that sets tmpCommands to value such as BYPASS_ASSIGNED_TO_CHECK */
select distinct(name) 
from filter t1, filter_push t2 
where (t2.assignshort like '%BYPASS_ASSIGNED_TO_CHECK%' or t2.assignlong like '%BYPASS_ASSIGNED_TO_CHECK%') and t1.filterid=t2.filterid
order by t1.name;

/* Search for Set Fields actions that use LTRIM function */
select distinct(name) 
from filter t1, filter_set t2 
where (t2.assignshort like '%105\19\1%' or t2.assignlong like '%LTRIM%') and t1.filterid=t2.filterid
order by t1.name;

/* Search for Push Fields where value has 60 open paren characters; this causes issue with exporting as xml (dcr5209) */
select distinct(name) 
from filter t1, filter_push t2 
where (t2.assignlong like '%\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1\104\1%')
  and t1.filterid=t2.filterid
order by t1.name;

/*push fields filters by target form*/
select name,t2.assignshort 
from filter t1, filter_push t2 
where (t2.assignshort like '1\@\22\%') and t1.filterid=t2.filterid
order by t2.assignshort;

/*push fields filters where tmpTemp fields are pushed as values or in qualifications*/
select * from filter_push where filterid in (select filterid from filter where name = 'EPM_CAL_NfySubmit_900');

select name from filter where not name like '%`!' AND filterid in 
(select filterid from filter_push where 
   assignlong like '%540000000%' OR 
   assignlong like '%540000001%' OR 
   assignlong like '%540000002%' OR 
   assignlong like '%540000003%' OR 
   assignlong like '%540000004%' OR 
   assignlong like '%540000005%' OR 
   assignlong like '%540000006%' OR 
   assignlong like '%540000007%' OR 
   assignlong like '%540000008%' OR 
   assignlong like '%540000050%' OR 
   assignlong like '%540000051%' OR 
   assignlong like '%540002120%' OR 
   assignlong like '%900164905%' OR
   assignlong like '%540000150%' OR 
   assignlong like '%540000151%' OR 
   assignlong like '%540000152%' OR 
   assignlong like '%540000153%' OR 
   assignlong like '%540002500%' OR
   assignshort like '%540000000%' OR 
   assignshort like '%540000001%' OR 
   assignshort like '%540000002%' OR 
   assignshort like '%540000003%' OR 
   assignshort like '%540000004%' OR 
   assignshort like '%540000005%' OR 
   assignshort like '%540000006%' OR 
   assignshort like '%540000007%' OR 
   assignshort like '%540000008%' OR 
   assignshort like '%540000050%' OR 
   assignshort like '%540000051%' OR 
   assignshort like '%540002120%' OR 
   assignshort like '%900164905%' OR
   assignshort like '%540000150%' OR 
   assignshort like '%540000151%' OR 
   assignshort like '%540000152%' OR 
   assignshort like '%540000153%' OR 
   assignshort like '%540002500%') 
order by name;

select unique(fieldname),fieldid from field where 
   fieldid = 540000000 OR 
   fieldid = 540000001 OR 
   fieldid = 540000002 OR 
   fieldid = 540000003 OR 
   fieldid = 540000004 OR 
   fieldid = 540000005 OR 
   fieldid = 540000006 OR 
   fieldid = 540000007 OR 
   fieldid = 540000008 OR 
   fieldid = 540000050 OR 
   fieldid = 540000051 OR 
   fieldid = 540002120 OR 
   fieldid = 900164905 OR
   fieldid = 540000150 OR 
   fieldid = 540000151 OR 
   fieldid = 540000152 OR 
   fieldid = 540000153 OR 
   fieldid = 540002500
order by fieldid;

/* Search for WEB SERVICE consumption workflow */
select distinct(name),t2.FILTERID,t2.ACTIONINDEX 
from filter t1, filter_set t2 
where (t2.assignlong like '%WEBSERVICE%') and t1.filterid=t2.filterid
order by t1.name;
/* Search for external WEB SERVICE endpoint */
select distinct(name),t2.FILTERID,t2.ACTIONINDEX 
from filter t1, filter_set t2 
where (t2.assignlong like '%WEBSERVICE%') and t1.filterid=t2.filterid and t2.assignlong like '%qa3scvsail00%'
order by t1.name;

select name 
from escalation 
where queryshort like '%CREATE_DISTRIBUTED_PENDING%' or querylong like '%CREATE_DISTRIBUTED_PENDING%'
order by name;

select t1.fieldid,t1.fieldname,t2.maxlength 
from field t1, field_char t2 
where t1.schemaid=292 and t2.schemaid=292 and t1.fieldtype=1 and t1.fieldid = t2.fieldid
order by t1.fieldid asc;

select name from actlink where actlinkid in (select actlinkid from actlink_set where assignshort like '%HOUSE_MASTER%');
select * from actlink_set where assignshort like '%CUSTOMER_MASTER%';
select name from actlink where actlinkid in (select actlinkid from actlink_set where assignlong like '%112%' or assignshort like '%112%');
select name from filter where filterid in (select filterid from filter_push where assignlong like '%900050221%' or assignshort like '%900050221%'); /*InitiatingTicketType*/
select name from filter where queryshort like '%900050257%' or querylong like '%900050257%'; /*SupressionFlag*/
select name from filter where queryshort like '%900116107%' or querylong like '%900116107%'; /*Weight*/
select name from filter where queryshort like '%900050221%' or querylong like '%900050221%'; /*InitiatingTicketType*/
select name from filter where queryshort like '%540000025%' or querylong like '%540000025%'; /*tmpTempExternalQual*/
select name from filter where queryshort like '%APP-Management%' or querylong like '%APP-Management%';

select name,timestamp,TO_CHAR(TO_DATE('19700101000000', 'YYYYMMDDHH24MISS')+((timestamp-(60*60*4)) /(60*60*24)),'YYYYMMDDHH24MISS')
from filterwhere filterid in (select filterid from filter_push where assignlong like '%540002102%' or assignshort like '%540002102%')
order by timestamp desc;

select * from actlink_push where assignlong like '%NFY_Notifications%';
select * from actlink_set where assignshort like '%CUSTOMER_MASTER%';
select name from actlink where actlinkid in (select actlinkid from actlink_set where assignlong like '%540000025%' or assignshort like '%540000025%');
select name from filter where filterid in (select filterid from filter_push where assignlong like '%NFY_SendNotification%' or assignshort like '%NFY_SendNotification%')
   order by name;
   
/*Possible guides that call objects*/   
select name from arcontainer where containerid in 
(select containerid from arreference where referenceobjid in
(select actlinkid from actlink where name like '%EPM_CBI_cmdSetCustInfofromCustomerMaster_001%'
)
);

select name from arcontainer where containerid in 
(select containerid from arreference where referenceobjid in
(select filterid from filter where name like '%EPM_CUI_cmdLinkDown_110%'
)
);

select name,containerid from arcontainer where name = 'SLA_ACT_NotifyAssignedGroup';
select containerid,referenceid,referenceobjid from arreference where containerid='1200';
select * from actlink where name like '%EPM_CBI_cmdSetCustInfofromCustomerMaster_001%';
select distinct referenceobjid from arreference order by referenceobjid desc;

/* Find filters that call guides */
select name from filter where filterid in 
(
select filterid from filter_call where guidename like '%EPM_CUI_GetCustInfoByAccount%'
)
;

/* Find filters that Goto specific labels */
select name from filter where filterid in 
(
select filterid from filter_goto where LABEL='ASSETFAIL_EXTENDED'
)
;

select t1.name,t2.guidename 
from filter t1, filter_call t2 
where (t2.guidename like '%NCO_EVT_ValidateAssignment%') and t1.filterid=t2.filterid
order by t1.name;

/* find filter set fields actions by target field id */
select distinct(name) 
from filter t1, filter_set t2 
where (t2.fieldid = 536871047 /*zTmpCommand*/) and t1.filterid=t2.filterid
order by t1.name;

-- containers
/* count containers by type, 1=ActLinkGuide, 2=Application, 3=PackingList, 4=FilterGuide, 5=WebService */
select CONTAINERTYPE,count(*) from arcontainer group by CONTAINERTYPE order by containertype;
/* find filter guides that are not called by any filters */
select name from arcontainer where CONTAINERTYPE = 4 and name not in (
select guidename from filter_call)
order by name;
/* find active link guides that are not called by any active links */
select name from arcontainer where CONTAINERTYPE = 1 and name not in (
select guidename from actlink_call)
order by name;

-- ldap
select schemaid,name from arschema where name like '%ldap%';

select name,queryshort,executemask,actlinkid from actlink where name like '%Ldap%';
select name from actlink where actlinkid in (
   select actlinkid from actlink_set where assignshort like '%ardbc_ldap_user%');
   
select name from filter where filterid in (
   select filterid from filter_set where assignshort like '%ardbc_ldap_user%');
   
select * from actlink where name = 'EPM_CBI_cmdOnReturnCoAddress_002';
select * from actlink_set where actlinkid=13019;
select * from actlink_set where assignlong like '%107\1\*%' order by actlinkid desc; /*may show invalid server references*/