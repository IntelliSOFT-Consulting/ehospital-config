
SELECT '≤ 18.4' AS 'BMI' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale' 
  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('BMI')
   AND o.value_numeric <=18.4
   
UNION ALL  

SELECT '18.5- 24.9' AS 'BMI' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale' 
  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('BMI')
   AND o.value_numeric BETWEEN 18.5 AND 24.9
   
UNION ALL  

SELECT '25 - 29.9' AS 'BMI' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale' 
  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('BMI')
   AND o.value_numeric BETWEEN 25 AND 29.9 
   
UNION ALL  

SELECT '≥ 30' AS 'BMI' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale' 
  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('BMI')
   AND o.value_numeric >= 30 ;
 
 
	