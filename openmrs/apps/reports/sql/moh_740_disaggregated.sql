select 'Cumulative no. of diabetes patients in care' AS 'Diagnosis',
count(distinct(case when personCount is not null and gender = 'M' then personCount end)) as 'M',
count(distinct(case when personCount is not null and gender = 'F' then personCount end)) as 'F'
 from (
select  count(distinct(p.person_id)) as 'personCount', pt.patient_id,  p.gender, p.birthdate, o.value_coded from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register, Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
 and o.voided = 0
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)t 
union all
select 'Cumulative no. of hypertension patients in care' AS 'Diagnosis' ,
count(distinct(case when personCount is not null and gender = 'M' then personCount end)) as 'M',
count(distinct(case when personCount is not null and gender = 'F' then personCount end)) as 'F' from (
select  count(distinct(p.person_id)) as 'personCount', pt.patient_id,  p.gender, p.birthdate, o.value_coded from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register, Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0  and o.value_coded = (select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)t
union all
select 'Cumulative no. of co-morbid DM+HTN patients in care' AS 'Diagnosis', 
count(distinct(case when pid is not null and gender = 'M' then pid end)) as 'M',
count(distinct(case when pid is not null and gender = 'F' then pid end)) as 'F'
from(
select person_id as pid from (
select p.person_id, pt.patient_id,  p.gender, p.birthdate, o.value_coded from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0  
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)t 
)tPatientsWithComorbites
inner join (
select p.person_id as prsnId , pt.patient_id,  p.gender, p.birthdate, o.value_coded, o.concept_id from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register, Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0 and o.value_coded in ((select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'), 
(select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
,(select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'))
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)tPatientWithHTNorDM on tPatientsWithComorbites.pid = tPatientWithHTNorDM.prsnId
union all
select 'No. of new diabetes cases' AS 'Diagnosis' , 
count(distinct(case when personCount is not null and gender = 'M' then personCount end)) as 'M',
count(distinct(case when personCount is not null and gender = 'F' then personCount end)) as 'F' from (
select  count(distinct(p.person_id)) as 'personCount', pt.patient_id,  p.gender, p.birthdate, o.value_coded from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Diabetes New Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
 and o.voided = 0 and o.value_coded = (select concept_id from concept_name where name = 'TRUE' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)t
union all
select 'No. of new hypertension cases' AS 'Diagnosis',
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
from (
select  obs.person_id as 'pidd', concept_id, obs_datetime , encounter_id , value_coded , obs.voided , gender from obs 
left join person p on obs.person_id = p.person_id
where concept_id =
(select concept_id from concept_name where name = 'HTN Status' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'New' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'HTN Status' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate 
union all
select 				
'First visit to clinic (DM and/or HTN)' as 'Diagnosis',
count(distinct(case when prsnId is not null and gender = 'M' then prsnId end)) as 'M',
count(distinct(case when prsnId is not null and gender = 'F' then prsnId end)) as 'F'
  from (
select p.person_id as prsnId , p.gender, p.birthdate, o.value_coded, o.concept_id from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register, Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0 and o.value_coded in ((select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'), 
(select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
,(select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'))
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  
)tDiabettes
inner join(
select patient_id from (
select patient_id, count(patient_id) as pid from (
select patient_id ,@row_num := IF(@prev_value = patient_id,@row_num+1,1) AS row_num,@prev_value:= patient_id, date_started, date_stopped ,
visit_id, voided from visit 
order by patient_id
)tVisitOne group by patient_id 
)t where pid = 1
)tFistVisit on tDiabettes.prsnId = tFistVisit.patient_id 
union all
select 				
'Re-visit to clinic (DM and/or HTN)' as 'Diagnosis', 
count(distinct(case when prsnId is not null and gender = 'M' then prsnId end)) as 'M',
count(distinct(case when prsnId is not null and gender = 'F' then prsnId end)) as 'F'
 from (
select p.person_id as prsnId , p.gender, p.birthdate, o.value_coded, o.concept_id from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register, Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0 and o.value_coded in ((select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'), 
(select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
,(select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'))
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  
)tDiabettes
inner join(
select patient_id from (
select patient_id, count(patient_id) as pid from (
select patient_id ,@row_num := IF(@prev_value = patient_id,@row_num+1,1) AS row_num,@prev_value:= patient_id, date_started, date_stopped ,
visit_id, voided from visit 
order by patient_id
)tVisitOne group by patient_id 
)t where pid > 1
)tFistVisit on tDiabettes.prsnId = tFistVisit.patient_id 
union all
select "" as Diagnosis, "" as 'M' , "" as 'F'
union all 
select "Total no. with Type 1 Diabetes" as Diagnosis, "" as 'M' , "" as 'F'
union all
select '0-5 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate, p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') < 5
union all
select '6-18 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate, p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 6 and TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 18
union all
select '19-35 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 19 and TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 35
union all
select 'Over 36', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 36
union all
select "" as Diagnosis, "" as 'M' , "" as 'F'
union all 
select "Total no. with Type 2 Diabetes" as Diagnosis,  "" as 'M' , "" as 'F'
union all
select '0-18 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 18
union all 
select '19-35 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 19 and TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 35
union all 
select '36-60 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 36 and TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 60
union all
select '> 60 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 60 
union all
select 'No. screened for Gestational Diabetes Mellitus' AS 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_coded , p.gender from obs
left join person p on obs.person_id = p.person_id
 where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Gestational Diabetes Mellitus' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate 
union all
select 'No. diagnosed for Gestational Diabetes Mellitus' AS 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_coded , p.gender from obs
left join person p on obs.person_id = p.person_id
 where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Gestational Diabetes Mellitus' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate 
union all
select 'No. of Diabetes secondary to other causes' AS 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_coded , p.gender from obs
left join person p on obs.person_id = p.person_id
 where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetes secondary to other causes' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate 
union all
select 'No. of patients on insulin' AS 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_coded , p.gender from obs
left join person p on obs.person_id = p.person_id
 where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Insulin' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate
union all
select 'No. of patients on OGLAs' AS 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_coded , p.gender from obs
left join person p on obs.person_id = p.person_id
 where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'OGLAs,Treatment Drug' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate  
union all
select 'No. of patients on diet and exercise only (DM and HTN)' as 'Diagnosis', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select person_id , gender from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender  from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diet and Physical Activity Drugs' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
)tDietAndTreatment inner join(
select pid from(
select person_id as pid from (
select p.person_id, pt.patient_id,  p.gender, p.birthdate, o.value_coded from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0  
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)t 
)tPatientsWithComorbites
inner join (
select p.person_id as prsnId , pt.patient_id,  p.gender, p.birthdate, o.value_coded, o.concept_id from person p 
inner join patient pt on p.person_id = pt.patient_id
left join obs o on p.person_id = o.person_id where o.concept_id = (select concept_id from concept_name where name = 'Daily Register, Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
and o.voided = 0 and o.value_coded in ((select concept_id from concept_name where name = 'Diabetes mellitus, type 1' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'), 
(select concept_id from concept_name where name = 'Diabetes mellitus, type 2' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED')
,(select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED'))
and o.obs_datetime >= '#startDate#' and  o.obs_datetime <= (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) 
)tPatientWithHTNorDM on tPatientsWithComorbites.pid = tPatientWithHTNorDM.prsnId
)tHTNandDM on tDietAndTreatment.person_id = tHTNandDM.pid 
union all
select 'No. of patients done HbA1c' as 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
 from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_numeric , p.gender from obs 
left join person p on obs.person_id = p.person_id
where concept_id =
(select concept_id from concept_name where name ='CURRENT HbA1c(%)' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='CURRENT HbA1c(%)' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate 
union all
select  '% that met HbA1c target (< 7%)' as 'Diagnosis', 
count(distinct(case when pidd is not null and gender = 'M' then pidd end)) as 'M',
count(distinct(case when pidd is not null and gender = 'F' then pidd end)) as 'F'
 from (
select  obs.person_id as pidd, concept_id, obs_datetime , encounter_id , value_numeric , p.gender from obs 
left join person p on obs.person_id = p.person_id
where concept_id =
(select concept_id from concept_name where name ='CURRENT HbA1c(%)' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name ='CURRENT HbA1c(%)' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.pidd = c.pid and a.encounter_id = c.maxdate and value_numeric < 7
union all
select "" as Diagnosis , "" as 'M' , "" as 'F'
union all 
select "Total no. with hypertension" as Diagnosis , "" as 'M' , "" as 'F'
union all
select '0-18 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 18
union all
 select '19-35 years',
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 19 and TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 35
union all 
select '36-60 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 36 and TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') <= 60
union all
select '> 60 years', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Hypertension,Diagnosis' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Diagnosis' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate where TIMESTAMPDIFF(YEAR,birthdate,'#endDate#') >= 60
union all
 select 'No. of patients on antihypertensives', 
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate, p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Anti-hypertensives Drugs' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register, Treatment Drugs' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate 
union all
select 'No. with high BP at clinic visit (≥140/90)',
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_numeric , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Blood pressure (mmHg)' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Blood pressure (mmHg)' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate and value_numeric >= 140 
union all
SELECT
'Total no. of patients with CVD (new diagnosis)' AS 'Diagnosis' , '' AS 'M' , '' as 'F'
union all
select 'Stroke' as 'Diagnosis',
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Stroke' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all 
select 'Ischemic heart disease' as 'Diagnosis', 
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
 from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Ischemic heart disease' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'Peripheral vascular disease' as 'Diagnosis',
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Peripheral vascular disease' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'Heart failure' as 'Diagnosis', 
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Heart failure' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'No. of Patients with neuropathies (new diagnosis)' as 'Diagnosis', 
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Nephropathy' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'No. of patients screened for diabetic foot' as 'Diagnosis', 
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetic foot' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'No. of patients with diabetic foot ulcer (new diagnosis)' as 'Diagnosis', 
 count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Diabetic foot' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'No. of feet saved through treatment' as 'Diagnosis', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate , p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Footcare outcome' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Ulcer Healed' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Footcare outcome' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
union all
select 'No. of Amputation due to diabetic foot' as 'Diagnosis' , null as 'M' , '' as 'F'
union all
select 'No. with kidney complications (new diagnosis)' as 'Diagnosis' , null as 'M' , '' as 'F'
union all
select 'No. of patients with diabetic foot ulcer (new diagnosis)' as 'Diagnosis', 
count(distinct(case when person_id is not null and gender = 'M' then person_id end)) as 'M',
count(distinct(case when person_id is not null and gender = 'F' then person_id end)) as 'F'
from (
select  obs.person_id, obs.concept_id, obs_datetime , obs.encounter_id , value_coded , obs.voided, p.birthdate, p.gender from obs 
left join person p on obs.person_id = p.person_id 
where concept_id =
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59'))  and 
value_coded = (select concept_id from concept_name where name = 'Retinopathy' and voided = 0 and concept_name_type = 'FULLY_SPECIFIED') and obs.voided = 0
)a inner join (select person_id as pid , concept_id as cid, max(encounter_id) maxdate from obs where concept_id = 
(select concept_id from concept_name where name = 'Daily Register,Diagnosis Complications' and concept_name_type = 'FULLY_SPECIFIED' and voided = 0) 
and obs_datetime  between DATE_FORMAT('#startDate#','%Y-%m-01') and (DATE_FORMAT(('#endDate#'),'%Y-%m-%d 23:59:59')) group by pid) c on 
a.person_id = c.pid and a.encounter_id = c.maxdate
