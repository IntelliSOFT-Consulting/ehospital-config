
SELECT 'No. with type 1 DM' AS 'Types of Diabetes' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Final diagnosis')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 1') AND cn.locale = 'en')

UNION ALL 
   
SELECT 'No. with type 2 DM' AS 'Types of Diabetes' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Final diagnosis')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetes mellitus, type 2') AND cn.locale = 'en')
  
   UNION ALL 
   
SELECT 'No. with GDM' AS 'Types of Diabetes' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Final diagnosis')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Gestational Diabetes Mellitus') AND cn.locale = 'en') ;
  
  

 
	