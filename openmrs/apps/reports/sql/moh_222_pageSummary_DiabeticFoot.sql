
SELECT 'Yes' AS 'Diabetic Foot' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded IN (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diabetic foot') AND cn.locale = 'en')
   
UNION ALL 

SELECT 'No' AS 'Diabetic Foot' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Daily Register,Diagnosis Complications')
   AND o.value_coded IN (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name NOT IN ('Diabetic foot') AND cn.locale = 'en') ;
   
         
   
   





 
	