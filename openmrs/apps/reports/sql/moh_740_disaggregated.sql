
SELECT 
'Cumulative no. of diabetes patients in care' AS 'Diagnosis' ,
 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1 ','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes')  AND c.locale = 'en' AND p.gender = 'M') THEN 1 END)  AS 'MALE',
 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1 ','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes')  AND c.locale = 'en' AND p.gender = 'F') THEN 1 END)  AS 'FEMALE', 
 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1 ','Diabetes mellitus, type 2','Gestational Diabetes Mellitus','Diabetes secondary to other causes')  AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1


UNION ALL 

SELECT 
'Cumulative no. of hypertension patients in care' AS 'Diagnosis' ,
 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Hypertension', 'Pre-eclampsia')  AND c.locale = 'en') AND  p.gender = 'M' THEN 1 END)  AS 'Male' ,  
 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Hypertension', 'Pre-eclampsia')  AND c.locale = 'en') AND  p.gender = 'F' THEN 1 END)  AS 'FEMale' , 
 SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Hypertension', 'Pre-eclampsia')  AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 

SELECT
'Cumulative no. of co-morbid DM+HTN patients in care' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded IS NOT NULL AND p.gender  = 'M' THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded IS NOT NULL AND p.gender  = 'F' THEN 1 END)  AS 'FeMale' ,
SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1

UNION ALL 

SELECT
'No. of new diabetes cases' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male'  ,  
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Female'  ,  
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'HTN Status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 
 
 SELECT
'No. of new hypertension cases' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New') AND c.locale = 'en') and p.gender = 'M' THEN 1 END) AS 'Male', 
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New') AND c.locale = 'en') and p.gender = 'F' THEN 1 END) AS 'Female', 
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'HTN Status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 

 SELECT 
'First visit to clinic (DM and/or HTN)' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded IS NOT NULL AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded IS NOT NULL AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
      
UNION ALL 

 SELECT
'Re-visit to clinic (DM and/or HTN)' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded IS NOT NULL AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded IS NOT NULL AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded IS NOT NULL THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 

SELECT
'Total no. with Type 1 Diabetes' AS 'Diagnosis' ,
'' AS '',
'' AS '',
'' AS 'Totals'

UNION ALL 

SELECT
'0-5 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') <= 5
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
 UNION ALL 

SELECT
'6-18 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 6 AND 18
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
   
 UNION ALL 

SELECT
'19-35 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 19 AND 35
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
 UNION ALL 

SELECT
'Over 36 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') >=36
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  

UNION ALL 

SELECT
'Total no. with Type 2 Diabetes' AS 'Diagnosis' ,
'' AS '',
'' AS '',
'' AS 'Totals'

UNION ALL 

SELECT
'0-18 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') <= 18
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 

SELECT
'19-35 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 19 AND 35
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
   
UNION ALL 

SELECT
'36-60 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 36 AND 60
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 
   
UNION ALL 

 SELECT
'> 60 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'M' THEN 1 END)  AS 'Male',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') and p.gender = 'F' THEN 1 END)  AS 'Feale',
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 2') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#')  >= 60
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1   
   

UNION ALL 

SELECT
'No. screened for Gestational Diabetes Mellitus' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Gestational Diabetes Mellitus') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Gestational Diabetes Mellitus') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Gestational Diabetes Mellitus') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
 
UNION ALL  

SELECT
'No. diagnosed for Gestational Diabetes Mellitus' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Gestational Diabetes Mellitus') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Gestational Diabetes Mellitus') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Gestational Diabetes Mellitus') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 
   
UNION ALL  

SELECT
'No. of Diabetes secondary to other causes' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes secondary to other causes') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes secondary to other causes') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes secondary to other causes') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Final diagnosis'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 
   
UNION ALL  

SELECT
'No. of patients on insulin' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Insulin') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Insulin') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Insulin') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Treatment'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  
 
UNION ALL  

SELECT
'No. of patients on OGLAs' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('OGLAs,Treatment Drug') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('OGLAs,Treatment Drug') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('OGLAs,Treatment Drug') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Treatment'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  
   
UNION ALL  

SELECT
'No. of patients on both (Insulin and OGLAs)' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('OGLAs,Treatment Drug' ,'Insulin') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('OGLAs,Treatment Drug' ,'Insulin') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('OGLAs,Treatment Drug' ,'Insulin') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Treatment'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  
   
UNION ALL  

SELECT
'No. of patients on diet and exercise only (DM and HTN)' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diet and Physical Activity Drugs') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diet and Physical Activity Drugs') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diet and Physical Activity Drugs') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'Treatment'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  
   
UNION ALL  

SELECT
'No. of patients done HbA1c' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_numeric IS NOT NULL AND p.gender = 'M' THEN 1 END)  AS 'Male' , 
SUM(CASE WHEN o.value_numeric IS NOT NULL AND p.gender = 'F' THEN 1 END)  AS 'Female' ,    
SUM(CASE WHEN o.value_numeric IS NOT NULL THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
   AND c.name = 'CURRENT HbA1c(%)'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  
   
UNION ALL  

SELECT
'% that met HbA1c target (< 7%)' AS 'Diagnosis' ,
'' AS '',
'' AS '',
((select COUNT(o.person_id) FROM openmrs.obs o ,openmrs.concept_name cn WHERE o.concept_id = cn.concept_id AND cn.name IN ('CURRENT HbA1c(%)') AND cn.locale = 'en'AND cn.locale_preferred = 1  AND o.value_numeric < 7 AND  o.obs_datetime BETWEEN '#startDate#' AND '#endDate#') * 100 / 
(select COUNT(o.person_id) FROM openmrs.obs o ,openmrs.concept_name cn WHERE o.concept_id = cn.concept_id AND cn.name IN ('CURRENT HbA1c(%)') AND cn.locale = 'en'AND cn.locale_preferred = 1  AND o.value_numeric IS NOT NULL AND  o.obs_datetime BETWEEN '#startDate#' AND '#endDate#') )AS Totals

UNION ALL 

SELECT
'Total no. with hypertension' AS 'Diagnosis' ,
'' AS '',
'' AS '',
'' AS 'Totals'

UNION ALL

SELECT
'0-18 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') <= 18
   AND c.name = 'HTN Status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 
   
UNION ALL 

SELECT
'19-35 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 19 AND 35
   AND c.name = 'HTN Status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 
   
UNION ALL 

SELECT
'36-60 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') BETWEEN 36 AND 40
   AND c.name = 'HTN Status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 
   
UNION ALL 

 SELECT
'> 60 years' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('New','Known') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id AND TIMESTAMPDIFF(YEAR, p.birthdate, '#startDate#') >= 60
   AND c.name = 'HTN Status'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1  
   
   
UNION ALL   
     
SELECT 'No. of patients on antihypertensives' AS 'Diagnosis' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Antihypertensives') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Antihypertensives') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Antihypertensives' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Treatment'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1

UNION ALL   
      
     
SELECT 'No. with high BP at clinic visit (≥140/90)' AS 'Diagnosis' ,
SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Systolic' AND c.locale = 'en') AND o.value_numeric >140) AND 
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Diastolic' AND c.locale = 'en') AND o.value_numeric >90)
    AND p.gender = 'M' THEN 1 END)  AS 'Male' ,
 SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Systolic' AND c.locale = 'en') AND o.value_numeric >140) AND 
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Diastolic' AND c.locale = 'en') AND o.value_numeric >90)
    AND p.gender = 'F' THEN 1 END)  AS 'Female' ,
 SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Systolic' AND c.locale = 'en') AND o.value_numeric >140) AND 
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Diastolic' AND c.locale = 'en') AND o.value_numeric >90)
    THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.person p ON o.person_id = p.person_id

UNION ALL 
  		
SELECT
'Total no. of patients with CVD (new diagnosis)' AS 'Diagnosis' ,
'' AS '',
'' AS '',
'' AS 'Totals'

UNION ALL   
     
SELECT 'Stroke' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Stroke') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Stroke') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Stroke' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
	

UNION ALL   
     
SELECT 'Ischemic heart disease' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Ischemic heart disease' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Ischemic heart disease' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Ischemic heart disease' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	

UNION ALL   
     
SELECT 'Peripheral vascular/artery disease' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Peripheral vascular disease' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Peripheral vascular disease' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Peripheral vascular disease' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
	
UNION ALL   
     
SELECT 'Heart failure' AS 'Diagnosis' ,
   SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Heart failure' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Heart failure' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Heart failure' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. of Patients with neuropathies (new diagnosis)' AS 'Diagnosis' ,
     SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Peripheral Neuropathy',
'Nephropathy') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Peripheral Neuropathy',
'Nephropathy') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Peripheral Neuropathy',
'Nephropathy') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. of patients screened for diabetic foot' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Diabetic foot' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Diabetic foot' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetic foot') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
	
UNION ALL   
     
SELECT 'No. of patients with diabetic foot ulcer (new diagnosis)' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Diabetic foot' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Diabetic foot' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetic foot') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Daily Register,Diagnosis Complications'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
	
UNION ALL   
     
SELECT 'No. of feet saved through treatment' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Surgical debridement' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'Surgical debridement' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Surgical debridement') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Footcare outcome'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. of Amputation due to diabetic foot' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Amputation') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Amputation') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Amputation') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Footcare outcome'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. with kidney complications (new diagnosis)' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = ''
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. with diabetic retinopathy (new diagnosis)' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('') AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = ''
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. Screened for Tuberculosis' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('TRUE') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('TRUE') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'TRUE' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Diabetes, Screend For TB'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1
	
UNION ALL   
     
SELECT 'No. Screened Positive for Tuberclosis' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('POSTIVE') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('POSTIVE') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'POSTIVE' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Diabetes, TB Status after Screening'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'Total admitted' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Admitted' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Footcare outcome'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. admitted with DKA' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Admitted' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Footcare outcome'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'No. admitted with Hypoglycemia' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Admitted' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'Footcare outcome'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1		
	
	
UNION ALL   
     
SELECT 'No. admitted with stroke' AS 'Diagnosis' ,
     SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Stroke') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    AND p.gender = 'M' THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Stroke') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    AND p.gender = 'F' THEN 1 END)  AS 'Female' ,
     SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Stroke') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    THEN 1 END)  AS 'Total'  
FROM openmrs.obs o 
INNER JOIN openmrs.person p ON o.person_id = p.person_id
	
UNION ALL   
     
SELECT 'No. admitted with heart failure' AS 'Diagnosis' ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Heart failure') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    AND p.gender = 'M' THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Heart failure') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    AND p.gender = 'F' THEN 1 END)  AS 'Female' ,
     SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Heart failure') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    THEN 1 END)  AS 'Total'  
FROM openmrs.obs o 
INNER JOIN openmrs.person p ON o.person_id = p.person_id
	
UNION ALL   
     
SELECT 'No. admitted with ischemic heart disease' AS 'Diagnosis' ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Ischemic heart disease') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    AND p.gender = 'M' THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Ischemic heart disease') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    AND p.gender = 'F' THEN 1 END)  AS 'Female' ,
   SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Daily Register,Diagnosis Complications' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Ischemic heart disease') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Footcare outcome' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted') AND c.locale = 'en'))
    THEN 1 END)  AS 'Total'  
FROM openmrs.obs o 
INNER JOIN openmrs.person p ON o.person_id = p.person_id
	
UNION ALL   
     
SELECT 'No. admitted with hypertension urgency/emergency' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  IN ('Admitted') AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Admitted')AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name IN ('Footcare outcome')
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1	
	
UNION ALL   
     
SELECT 'Total deaths due to diabetes complications' AS 'Diagnosis' ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Final diagnosis' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1 ' 
'Diabetes mellitus, type 2' ,'Gestational Diabetes Mellitus' ,'Diabetes secondary to other causes') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Patient status' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Deceased') AND c.locale = 'en'))
    AND p.gender = 'M' THEN 1 END)  AS 'Male'  ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Final diagnosis' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1 ' 
'Diabetes mellitus, type 2' ,'Gestational Diabetes Mellitus' ,'Diabetes secondary to other causes') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Patient status' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Deceased') AND c.locale = 'en'))
    AND p.gender = 'F' THEN 1 END)  AS 'Female'  ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Final diagnosis' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Diabetes mellitus, type 1 ' 
'Diabetes mellitus, type 2' ,'Gestational Diabetes Mellitus' ,'Diabetes secondary to other causes') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Patient status' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Deceased') AND c.locale = 'en'))
    THEN 1 END)  AS 'Total'  
FROM openmrs.obs o 
INNER JOIN openmrs.person p ON o.person_id = p.person_id

UNION ALL   
     
SELECT 'Total deaths due to hypertension complications' AS 'Diagnosis' ,
 SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Final diagnosis' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Hypertension','Pre-Eclampsia') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Patient status' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Deceased') AND c.locale = 'en'))
    AND p.gender = 'M' THEN 1 END)  AS 'Male'  ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Final diagnosis' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Hypertension','Pre-Eclampsia') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Patient status' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Deceased') AND c.locale = 'en'))
    AND p.gender = 'F' THEN 1 END)  AS 'Female'  ,
    SUM(CASE WHEN (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Final diagnosis' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Hypertension','Pre-Eclampsia') AND c.locale = 'en')) AND
    (o.concept_id = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'Patient status' AND c.locale = 'en') AND 
    o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name IN ('Deceased') AND c.locale = 'en'))
    THEN 1 END)  AS 'Total'  
FROM openmrs.obs o
INNER JOIN openmrs.person p ON o.person_id = p.person_id

UNION ALL   
     
SELECT 'No. enrolled with NHIF' AS 'Diagnosis' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name  = 'TRUE' AND c.locale = 'en') AND p.gender = 'M'THEN 1 END)  AS 'Male' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'TRUE' AND c.locale = 'en') AND p.gender = 'F'THEN 1 END)  AS 'Female' ,
    SUM(CASE WHEN o.value_coded = (SELECT c.concept_id FROM openmrs.concept_name c WHERE c.name = 'TRUE' AND c.locale = 'en') THEN 1 END)  AS 'Total'        
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id
INNER JOIN openmrs.person p ON o.person_id = p.person_id
   AND c.name = 'National Health Insurance Fund Member'
	AND o.obs_datetime BETWEEN '#startDate#' AND '#endDate#'
	AND locale = 'en' AND c.locale_preferred = 1 ;
		
	
	
	
   
   
  
   



