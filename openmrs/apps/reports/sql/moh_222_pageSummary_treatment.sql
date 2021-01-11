
SELECT 'Diet & Physical Activity' AS 'Treatment' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Treatment')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Diet and Physical Activity Drugs') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")
    
UNION ALL 
   
SELECT 'OGLAs' AS 'Treatment' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Treatment')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('OGLAs,Treatment Drug') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")
    
UNION ALL 
   
SELECT 'Insulin' AS 'Treatment' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Treatment')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Insulin') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")
   
UNION ALL 
   
SELECT 'Antihypertensives' AS 'Treatment' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Treatment')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Anti-hypertensives') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")    
         
   
UNION ALL 
   
SELECT 'Herbal' AS 'Treatment' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Treatment')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Herbal') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")   
   
UNION ALL 
   
SELECT 'Other' AS 'Treatment' ,
   SUM(CASE WHEN p.gender = 'M'  THEN 1 END ) AS 'Male' ,
   SUM(CASE WHEN  p.gender = 'F'  THEN 1 END ) AS 'FeMale'  
FROM openmrs.obs o 
INNER JOIN openmrs.concept_name c ON o.concept_id = c.concept_id 
INNER JOIN openmrs.person p ON o.person_id = p.person_id 
INNER JOIN openmrs.encounter e ON o.encounter_id  = e.encounter_id AND encounter_datetime BETWEEN '#startDate#' AND '#endDate#'
WHERE c.locale = 'en' AND c.concept_name_type = "FULLY_SPECIFIED" 
   AND c.name IN ('Treatment')
   AND o.value_coded = (SELECT cn.concept_id FROM openmrs.concept_name cn WHERE cn.name IN ('Other') AND cn.locale = 'en' AND cn.concept_name_type = "FULLY_SPECIFIED")    ; 
         
   
   





 
	