
SELECT 'Screened for TB' AS 'TB' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Diabetes, Screend For TB')
   AND o.value_coded IN (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('TRUE') AND cn.locale = 'en')
   
UNION ALL 

SELECT 'No Screened for TB Positive' AS 'TB' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Diabetes, TB Status after Screening')
   AND o.value_coded IN (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Positive') AND cn.locale = 'en') ;
   
         
   
   





 
	