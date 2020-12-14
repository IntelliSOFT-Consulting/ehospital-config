
SELECT 'First Vist' AS '' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Final diagnosis')
   AND o.value_coded IS NOT NULL
   
   UNION ALL 
  
 SELECT 'ReVists' AS '' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Final diagnosis')
   AND o.value_coded IS NOT NULL ;
   

 
	