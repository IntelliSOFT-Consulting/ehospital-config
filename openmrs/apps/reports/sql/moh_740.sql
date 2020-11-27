
SELECT 
'Cumulative no. of diabetes paents in care' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 1 ',
'Diabetes mellitus, type 2',
'Gestational Diabetes Mellitus',
'Diabetes secondary to other causes') 

UNION ALL 

SELECT 
'Cumulative no. of hypertension patents in care' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Hypertension', 'Pre-eclampsia') 
   
UNION ALL 

SELECT
'Cumulative no. of co-morbid DM+HTN patents in care' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1

UNION ALL 

SELECT
'No. of new diabetes cases' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Hypertension', 'Pre-eclampsia') 
   
UNION ALL 
 
 SELECT
'No. of new hypertension cases' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Hypertension', 'Pre-eclampsia') 
   
UNION ALL 

 SELECT 
'First visit to clinic (DM and/or HTN)' AS 'Diagnosis' ,
COUNT(DISTINCT e.patient_id ) AS Totals
FROM encounter e
WHERE 
    e.encounter_datetime IS NOT NULL 
    AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
      
UNION ALL 

 SELECT
'Re-visit to clinic (DM and/or HTN)' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 

SELECT
'Total no. with Type 1 Diabetes' AS 'Diagnosis' ,
'' AS 'Totals'

UNION ALL 

SELECT
'0-5 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') <= 5
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 1') 
   
 UNION ALL 

SELECT
'6-18 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 6 AND 18
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 1')
   
   
 UNION ALL 

SELECT
'19-35 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 9 AND 35
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 1')
   
 UNION ALL 

SELECT
'Over 36 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') >= 36
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 1')   

UNION ALL 

SELECT
'Total no. with Type 2 Diabetes' AS 'Diagnosis' ,
'' AS 'Totals'

UNION ALL 

SELECT
'0-18 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') <= 18
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 2') 
   
UNION ALL 

SELECT
'19-35 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 19 AND 35
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 2') 
   
UNION ALL 

SELECT
'36-60 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 36 AND 60
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 2')  
   
UNION ALL 

 SELECT
'> 60 years' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
LEFT JOIN openmrs.person p ON p.person_id = o.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') > 60
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes mellitus, type 2')    
   

UNION ALL 

SELECT
'No. screened for Gestatioonal Diabetes Mellitus' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Gestational Diabetes Mellitus') 
 
UNION ALL  

SELECT
'No. diagnosed for Gestational Diabetes Mellitus' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Gestational Diabetes Mellitus')  
   
UNION ALL  

SELECT
'No. of Diabetes secondary to other causes' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diabetes secondary to other causes')   
   
UNION ALL  

SELECT
'No. of patients on insulin' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Insulin ')  
 
UNION ALL  

SELECT
'No. of patients on OGLAs' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('OGLAs,Treatment Drug')  
   
UNION ALL  

SELECT
'No. of patients on both (Insulin and OGLAs)' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('OGLAs,Treatment Drug' ,'Insulin ') 
   
UNION ALL  

SELECT
'No. of patients on diet and exercise only (DM and HTN)' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('Diet and Physical Activity Drugs')  
   
UNION ALL  

SELECT
'No. of patients done HbA1c' AS 'Diagnosis' ,
SUM(CASE WHEN encounter_datetime IS NOT NULL THEN 1 ELSE 0 END) AS Totals
FROM openmrs.concept_name c 
LEFT JOIN openmrs.obs o ON c.concept_id = o.concept_id 
LEFT JOIN openmrs.encounter e ON o.encounter_id = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE 
   locale = 'en' AND c.locale_preferred = 1
   AND c.name IN ('CURRENT HbA1c(%)')  
   
UNION ALL  

SELECT
'% that met HbA1c target (< 7%)' AS 'Diagnosis' ,
((select COUNT(o.person_id) FROM openmrs.obs o ,openmrs.concept_name cn WHERE o.concept_id = cn.concept_id AND cn.name IN ('CURRENT HbA1c(%)') AND cn.locale = 'en'AND cn.locale_preferred = 1  AND o.value_numeric < 7 AND  o.obs_datetime BETWEEN '#startDate#' AND '#endDate#') * 100 / 
(select COUNT(o.person_id) FROM openmrs.obs o ,openmrs.concept_name cn WHERE o.concept_id = cn.concept_id AND cn.name IN ('CURRENT HbA1c(%)') AND cn.locale = 'en'AND cn.locale_preferred = 1  AND o.value_numeric IS NOT NULL AND  o.obs_datetime BETWEEN '#startDate#' AND '#endDate#') )AS Totals
     
     
   

   
   
  
   



