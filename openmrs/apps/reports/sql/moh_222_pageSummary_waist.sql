
SELECT 'No. of males with a WC > 102 centimetres' AS 'Waist Circumference' ,
   SUM(CASE WHEN p.person_id IS NOT NULL THEN 1 END ) AS 'No. with increased' 
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Waist circumference (cm)')
   AND o.value_numeric > 102
   AND p.gender = 'M'
   
UNION ALL 

SELECT 'No. of Females with a WC > 88 centimetres' AS 'Waist Circumference' ,
   SUM(CASE WHEN p.person_id IS NOT NULL THEN 1 END ) AS 'No. with increased' 
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' 
   AND c.name IN ('Waist circumference (cm)')
   AND o.value_numeric > 88
   AND p.gender = 'F' ;
   



 
	