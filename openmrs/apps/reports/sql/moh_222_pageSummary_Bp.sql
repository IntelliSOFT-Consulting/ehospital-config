SELECT 'Bp > 140/90' AS 'Bp Reading at clinic Vist' ,
   SUM(CASE WHEN p.gender = 'M' AND (c.name  = 'Systolic Data' AND o.value_numeric >140) OR  (c.name  = 'Diastolic Data' AND o.value_numeric > 90)THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F' AND (c.name  = 'Systolic Data' AND o.value_numeric >140) OR (c.name  = 'Diastolic Data' AND o.value_numeric > 90) THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' ;